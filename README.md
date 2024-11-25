Here’s a more polished and complete version of your README with added details for clarity:

---

# MarvelPageTest

This project is part of a technical screening. It generates HTML files with random Marvel character stories using the Marvel API.

## **Overview**

This Ruby package fetches random Marvel stories featuring specific characters. By default, the character is set to "The Incredible Hulk" (Bruce Banner's persona), but you can specify a different character as a command-line argument.

The generated HTML file includes:
- The story's title and description.
- A list of characters appearing in the story.
- Marvel's attribution text.

## **Setup Instructions**

### **Prerequisites**
Make sure you have the following installed:
- **Ruby** (version 2.7+ recommended)
- **Bundler**
- **MSYS2** (for Windows users)

### **Installation**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/jsnetors/marvel-comics-test
   cd marvel_comics_test
   ```

2. **Install Dependencies**:
   Run the following command to install required gems:
   ```bash
   bundle install
   ```

### **Environment Setup**

1. **Marvel API Keys**:
   - Register at [Marvel Developer Portal](https://developer.marvel.com/) to get your public and private API keys.
   - Create a `.env` file in the project root to store your keys securely:
     ```
     MARVEL_PUBLIC_KEY=your_public_key
     MARVEL_PRIVATE_KEY=your_private_key
     ```
   - Make sure the `.env` file is listed in your `.gitignore` to avoid committing it to version control.

### **Running the Project**

To generate an HTML page, run the following command:
```bash
ruby random_story_finder.rb
```
You can specify a character name to get a story about them:
```bash
ruby random_story_finder.rb Wolverine
```
If no character is provided, the default is "Hulk."

The HTML file will be saved in a folder named `random_stories` with a timestamped filename.

### **Troubleshooting**

#### **Common Errors**
1. **MSYS2 Installation Errors (Windows Only)**:
   - During installation, you might see an error like:
     ```
     MSYS2 seems to be unavailable
     Verify integrity of msys2-x86_64-20221028.exe ... Failed
     ```
   - If you encounter this error, manually install MSYS2 from [msys2.org](https://www.msys2.org/).

2. **Installing the Development Toolchain**:
   - After installing MSYS2, run the following command with admin privileges inside the project folder:
     ```bash
     ridk install
     ```
   - Enter the following:
     - `1` to check the installation.
     - `2` to update MSYS2.
     - `3` to install the development toolchain.

### **Folder Structure**

Here's an overview of the project structure:

```
marvel_comics_test/
│
├── .env                     # Contains Marvel API keys (not tracked by Git)
├── .gitignore               # Should include ".env, bundle, etc"
├── Gemfile                  # Defines Ruby dependencies (like `dotenv` and `httparty`)
├── Gemfile.lock             # Dependency lock file
├── random_story_finder.rb   # The tool itself
├── api/marvel_api.rb        # API interactions with Marvel
├── lib/html_generator.rb    # Script to generate HTML file
├── public/                  # Folder for generated HTML files (contains a sample)
├── README.md                # Instructions on how to run the project
```

## **Code Overview**

### **Marvel API Interactions (`marvel_api.rb`)**
The `MarvelAPI` class is responsible for making requests to the Marvel API:
- **`get_character_id`**: Finds the character's ID based on the name provided.
- **`random_story_finder`**: Fetches a random story for a specific character.

### **HTML Generation (`html_generator.rb`)**
The `HTMLGenerator` class creates an HTML file with the fetched story data:
- **`random_story_finder`**: Generates and saves an HTML file that includes the story's title, description, and character list.

## **License**

This project is for educational purposes as part of a technical test. It does not include a license.

## **Contact**

For any questions or feedback, feel free to reach out via the repository's issue tracker.