document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  // adding SF places as list items

  // Your code here
let addPlaceForm = document.getElementById("favorite-form")
addPlaceForm.addEventListener('submit', event => {
  // *cancel default behavior for this event*
  // if we don't include this line, the browser will do what it normally does
  // when you submit a form: make an HTTP request, causing a full page refresh
  event.preventDefault();

  // Get the name input element, get the value, and clear it.
  const placeNameInput = document.getElementsByClassName("favorite-input")
  const placeName = placeNameInput[0].value;
  placeNameInput[0].value = '';

  // Add a new li with the sheep's name to the sheep ul.
  const ul = document.getElementById("sf-places");
  const li = document.createElement('li');
  li.textContent = placeName;
  ul.appendChild(li);
});
  
  // adding new photos

  // Your code here

let togglePhotoButton = document.getElementsByClassName("photo-show-button")[0]
togglePhotoButton.addEventListener('click', event => {
  console.log(`clicked!`)
  let urlForm = document.getElementsByClassName("photo-form-container hidden")[0]
  let show = urlForm.className.split(" ").shift()
  urlForm.classList.add(show)
  if (urlForm.className === urlForm.classList[0]){
    urlForm.className = urlForm.classList[1]
  }else{
    urlForm.className = urlForm.classList[0]
  }
})


let addPhotoForm = document.getElementById("photo-form")
addPhotoForm.addEventListener('submit', event => {
  event.preventDefault();
  const urlInput = document.getElementsByClassName("photo-url-input")[0]
  const urlInputValue = urlInput.value
  
  let ul = document.getElementsByClassName("dog-photos")[0]
  let img = document.createElement('img')
  img.src = urlInputValue
  let li = document.createElement('li')
  li.append(img)
  ul.appendChild(li)
})
});