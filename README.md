---
- name: Check File Size and Send Email Notification
  hosts: all
  vars:
    filename: "your_filename"
    file_date: "{{ lookup('pipe', 'date +%Y%m%d') }}"
    file_path: "/path/to/{{ filename }}{{ file_date }}.log"
    max_size: 1073741824  # 3 GB in bytes

  tasks:
    - name: Get file stats
      stat:
        path: "{{ file_path }}"
      register: file_info

    - name: Check if file size is less than 1GB
      debug:
        msg: "File {{ file_path }} is less than 1GB"
      when: file_info.stat.exists and file_info.stat.size < max_size

    - name: Send email notification if file is less than 1GB
      mail:
        host: smtp.yourserver.com
        port: 587
        username: yourusername
        password: yourpassword
        to: Recipient <recipient@email.com>
        subject: 'File Size Alert'
        body: 'File {{ file_path }} is less than 1GB'
        secure: starttls
      when: file_info.stat.exists and file_info.stat.size < max_size
      delegate_to: localhost
