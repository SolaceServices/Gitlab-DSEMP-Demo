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

## 💾 How to Import and Use the `opentofu/full-pipeline` GitLab CI Component

GitLab CI/CD components can only be used within the same GitLab instance. To use the official `opentofu/full-pipeline` component on your self-managed GitLab, follow these simple steps:
* Source : [https://docs.gitlab.com/ci/components/#use-a-gitlabcom-component-on-gitlab-self-managed](https://docs.gitlab.com/ci/components/#use-a-gitlabcom-component-on-gitlab-self-managed)

### Step 1: Import the Component into Your GitLab

1. Go to your GitLab instance and create a new group named `components` (optional, but recommended for organization).
2. Within this group, click **New Project** → **Import project** → **Repository by URL**.
3. Enter the following repository URL:

   ```
   https://gitlab.com/gitlab-org/components/opentofu.git
   ```
4. Name the project `opentofu`.
5. (Optional, but recommended) Enable **"Mirror repository"** to automatically update your local copy.

### Step 2: Enable the Project as a CI/CD Component

1. Navigate to your newly imported project (`components/opentofu`).
2. Go to **Settings** → **General** → **Visibility, project features, permissions**.
3. Under **CI/CD Catalog**, enable the option **"This project is a component"**.
4. Click **Save**.

### Step 3: Ensure the Required Release Exists

1. Check that the tag `2.8.1` is available in your imported repository. (If mirrored, it should appear automatically.)
2. Ensure there is a GitLab release associated with the `2.8.1` tag. If needed, create a new release manually by navigating to **Deployments → Releases → New release**, selecting the tag `2.8.1`.

### Step 4: Use the Component in Your GitLab CI Pipeline

In your project's `.gitlab-ci.yml`, include the component as follows:

```yaml
include:
  - component: $CI_SERVER_FQDN/components/opentofu/full-pipeline@2.8.1
```

* `$CI_SERVER_FQDN` is a built-in variable pointing to your GitLab instance domain.
* Ensure you replace `components` with your actual group name if different.



---

## 📚 Helpful Links

* [GitLab Documentation](https://docs.gitlab.com/)
* [Solace Cloud Documentation](https://docs.solace.com/)
* [Terraform Registry – Solace Provider](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest)
* [OpenTofu Documentation](https://opentofu.org/)

---

Happy automating! 🚀
