# 🚀 Solace IaC Project Template

This template project provides a quick start for managing Solace resources with Infrastructure-as-Code using Terraform (or OpenTofu) and GitLab CI/CD. It will be good if you are starting from scratch. If you are already "live" with a lot of resources take a look at below section.

## 📋 Prerequisites

* **GitLab Account:**
  Create a free GitLab account at [https://gitlab.com](https://gitlab.com)

  > ⚠️ A 60-day free trial is available, and phone validation is required.

* **Terraform** (or **OpenTofu**) knowledge is recommended.

---

## 🏗️ Project Setup

### 1. **Create a Project**

* Create a new blank project in your gitlab account
* Clone this project localy
* Add your project as a remote using Gitlab pre completed code

### 2. **Configure GitLab Project Variables**

* Go to your project in GitLab > **Settings** > **CI / CD** > **Variables**
* Add the required variables (adapt names as needed for your resources/providers):

  | Variable Name             | Example Value                         | Type     | Description              |
  | ------------------------- | ------------------------------------- | -------- | ------------------------ |
  | `SOLACE_SANDBOX_USERNAME` | your\_sbx\_user                       | Variable | Solace sandbox username  |
  | `SOLACE_SANDBOX_PASSWORD` | your\_sbx\_password                   | Masked   | Solace sandbox password  |
  | `SOLACE_SANDBOX_URL`      | [https://sandbox](https://sandbox)... | Variable | Solace broker URL        |

  > **Tip:** Mark sensitive data as “masked” and/or “protected”.

---

### 3. **Edit/Add Terraform Files (`.tf`)**

* Add or modify your `.tf` files in the repo according to your resource needs.
* Example: create Solace resources, set variables, organize modules, etc.
* Commit your changes:

  ```bash
  git add .
  git commit -m "Add initial Solace resources"
  git push
  ```

---

### 4. **Review & Apply with GitLab CI/CD**

* The included `.gitlab-ci.yml` will automatically run `terraform plan` and `terraform apply` (or `tofu plan/apply`) on every commit.
* You can review pipeline status and logs in the **CI/CD > Pipelines** tab in your GitLab project.
* On successful `apply`, check your Solace broker to confirm that resources have been created/updated as expected.


---

## 🏨 Already running broker

* If you are already in a live environment. You will have to export existing conf using "generate" command of the Solace terraform provider and build your tfstate using "tf import" command following [official provider documentation](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/guides/provider#importing-resources).

---

## 🛠️ Customizing Your Project

* Adjust variables, modules, and resources in the `.tf` files as needed.
* Extend the CI/CD pipeline (`.gitlab-ci.yml`) for approval steps, destroy jobs, etc.
* For multiple environments (dev/preprod/prod), follow a folder or workspace convention.

---

## 📚 Helpful Links

* [GitLab Documentation](https://docs.gitlab.com/)
* [Solace Cloud Documentation](https://docs.solace.com/)
* [Terraform Registry – Solace Provider](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest)
* [OpenTofu Documentation](https://opentofu.org/)

---

Happy automating! 🚀
