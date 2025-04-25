# DnDwellers - BE

The backend API for **DnDwellers**, a customizable Dungeons & Dragons character builder. Built with Ruby on Rails and PostgreSQL, this API supports full character creation, skill tracking, and integration with the [D&D 5e API](https://www.dnd5eapi.co/) for spell, item, and class-based references.

### Live Backend

> [Check out the Deployed BE here](https://the-character-vault.onrender.com)

---

<details>
<summary><strong>Tech Stack</strong></summary>

- **Ruby on Rails** 7+
- **PostgreSQL**
- **RSpec** for testing
- External API: [D&D 5e API](https://www.dnd5eapi.co/)

</details>

---
<details>
<summary><strong>Setup & Installation</strong></summary>

## Setup & Installation

1. Clone the repository
`git clone https://github.com/YOUR-BE-REPO-HERE.git`

2. Navigate into the project folder
`cd dndweller-be`

3. Install dependencies
`bundle install`

4. Set up the database
`rails db:create
rails db:migrate
rails db:seed`

5. Run the server
`rails s`

</details>

---

<details>
<summary><strong>API Endpoints</strong></summary>

All endpoints are namespaced under: `/api/v1`

| Method | Endpoint               | Description                                                  |
|--------|------------------------|--------------------------------------------------------------|
| GET    | `/characters`          | Returns a list of all characters. Supports `?query=` search |
| GET    | `/characters/:id`      | Returns a specific character by ID                          |
| POST   | `/characters`          | Creates a new character                                     |
| DELETE | `/characters/:id`      | Deletes a character by ID                                   |

### Example:
```json
{
  "name": "Mila Oakshadow",
  "level": 3,
  "hp": 24,
  "race": "Elf",
  "class": "Rogue",
  "gender": "Female",
  "speed": 30,
  "armor_class": 14,
  "str": 8,
  "dex": 15,
  "con": 12,
  "int": 11,
  "wis": 10,
  "cha": 13,
  "user_id": 1,
  "token": "https://...",
  "languages": ["Common", "Elvish"],
  "skills": ["Stealth", "Investigation"],
  "equipment": ["Leather Armor", "Dagger"]
}
```

</details>

---


<div align="center">
  
### ⬇️ Collaborators & Contributions


  | Area | Lead |
  |------|------|
  | Front-End - UI Design & Styling | Shadeau Christensen |
  | Back-End - Routing & Navigation & Setup | Sebastian McKee |
  | Full-Stack - Testing & Error Handling & Project Visionary | Jacob Inman |
  | Back-End - API Integration & Setup | Rig Freyr |
  | Full-Stack - Deployement and BE Communications | Montana Pfeifer |

  ---
  
  <table>
    <tr>
      <td align="center">
        <strong>Jacob Inman</strong><br/>
        <a href="https://github.com/jinman14">
          <img src="https://img.shields.io/badge/GitHub-jinman14-800080?logo=github&style=for-the-badge" />
        </a><br/>
        <a href="https://www.linkedin.com/in/jacobinman">
          <img src="https://img.shields.io/badge/LinkedIn-jacobinman-800080?logo=linkedin&style=for-the-badge" />
        </a>
      </td>
      <td align="center">
        <strong>Montana Pfeifer</strong><br/>
        <a href="https://github.com/Montana-Pfeifer">
          <img src="https://img.shields.io/badge/GitHub-Montana--Pfeifer-FFD700?logo=github&style=for-the-badge" />
        </a><br/>
        <a href="https://www.linkedin.com/in/montanapfeifer/">
          <img src="https://img.shields.io/badge/LinkedIn-montanapfeifer-FFD700?logo=linkedin&style=for-the-badge" />
        </a>
      </td>
      <td align="center">
        <strong>Rig Freyr</strong><br/>
        <a href="https://github.com/ontruster74">
          <img src="https://img.shields.io/badge/GitHub-ontruster74-228B22?logo=github&style=for-the-badge" />
        </a><br/>
        <a href="https://www.linkedin.com/in/rigfreyr/">
          <img src="https://img.shields.io/badge/LinkedIn-rigfreyr-228B22?logo=linkedin&style=for-the-badge" />
        </a>
      </td>
    </tr>
  </table>
  
  <table>
    <tr>
      <td align="center">
        <strong>Sebastian McKee</strong><br/>
        <a href="https://github.com/0nehundr3d">
          <img src="https://img.shields.io/badge/GitHub-0nehundr3d-00FFFF?logo=github&style=for-the-badge" />
        </a><br/>
        <a href="https://www.linkedin.com/in/sebastiankmckee/">
          <img src="https://img.shields.io/badge/LinkedIn-sebastiankmckee-00FFFF?logo=linkedin&style=for-the-badge" />
        </a>
      </td>
      <td align="center">
        <strong>Shadeau Christensen</strong><br/>
        <a href="https://github.com/shadeauchristensen">
          <img src="https://img.shields.io/badge/GitHub-shadeauchristensen-C71585?logo=github&style=for-the-badge" />
        </a><br/>
        <a href="https://www.linkedin.com/in/shadeauchristensen/">
          <img src="https://img.shields.io/badge/LinkedIn-shadeauchristensen-C71585?logo=linkedin&style=for-the-badge" />
        </a>
      </td>
    </tr>
  </table>
</div>

<p align="center">
  <em>Reach out to us on <strong>LinkedIn</strong> or follow our journey on <strong>GitHub</strong>.</em>
</p>
