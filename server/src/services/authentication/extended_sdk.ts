import { Looker40SDK } from "@looker/sdk";

export interface FileContent {
  path: string;
  content: string;
}

export interface Directory {
  path: string;
}

export class ExtendedLooker40SDK extends Looker40SDK {
  /**
   * Get all files in a project.
   */
  async allProjectFiles(project_id: string, fields?: string): Promise<any[]> {
    const path = `/projects/${encodeURIComponent(project_id)}/files`;
    const query = fields ? { fields } : {};
    return await this.ok(this.get<any[], any>(path, query));
  }

  /**
   * Get file content.
   */
  async getFileContent(project_id: string, file_path: string): Promise<string> {
    const token = await this.authSession.getToken();
    const baseUrl = this.authSession.settings.base_url;
    const path = `/projects/${encodeURIComponent(project_id)}/file/content`;
    const url = new URL(`${baseUrl}/api/4.0${path}?file_path=${encodeURIComponent(file_path)}`);

    const response = await fetch(url.toString(), {
      headers: {
        'Authorization': `token ${token.access_token}`
      }
    });

    if (!response.ok) {
      throw new Error(`Failed to fetch project file: ${response.status} ${response.statusText}`);
    }

    return await response.text();
  }

  /**
   * Create a new file in a project.
   */
  async createFile(project_id: string, file_content: FileContent): Promise<any> {
    const path = `/projects/${encodeURIComponent(project_id)}/files`;
    return await this.ok(this.post<any, any>(path, null, file_content));
  }

  /**
   * Update a file in a project.
   */
  async updateFile(project_id: string, file_content: FileContent): Promise<any> {
    const path = `/projects/${encodeURIComponent(project_id)}/files`;
    return await this.ok(this.put<any, any>(path, null, file_content));
  }

  /**
   * Delete a file in a project.
   */
  async deleteFile(project_id: string, file_path: string): Promise<void> {
    const path = `/projects/${encodeURIComponent(project_id)}/files`;
    const query = { file_path };
    return await this.ok(this.delete<void, any>(path, query));
  }

  /**
   * Create a project directory.
   */
  async createProjectDirectory(project_id: string, directory_path: string): Promise<any> {
    const path = `/projects/${encodeURIComponent(project_id)}/directories`;
    const body: Directory = { path: directory_path };
    return await this.ok(this.post<any, any>(path, null, body));
  }

  /**
   * Delete a project directory.
   */
  async deleteProjectDirectory(project_id: string, directory_path: string): Promise<any> {
    const path = `/projects/${encodeURIComponent(project_id)}/directories`;
    const query = { path: directory_path };
    return await this.ok(this.delete<any, any>(path, query));
  }
}
