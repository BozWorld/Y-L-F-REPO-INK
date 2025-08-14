document.addEventListener("DOMContentLoaded", () => {
    const storyContainer = document.getElementById("story-container");

    // Exemple de contenu d'histoire
    const storyContent = `
        <p>Bienvenue dans l'histoire interactive.</p>
        <p>Que voulez-vous faire ensuite ?</p>
        <button onclick="handleChoice(1)">Choix 1</button>
        <button onclick="handleChoice(2)">Choix 2</button>
    `;

    // Injecter le contenu dans le conteneur
    storyContainer.innerHTML = storyContent;
});

// Fonction pour gérer les choix
function handleChoice(choice) {
    alert(`Vous avez choisi l'option ${choice}`);
}
