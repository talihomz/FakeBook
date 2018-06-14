document.addEventListener("DOMContentLoaded", () => {
  const dropdownBtn = document.querySelector('#dropdown-toggle');
  const dropdownContent = document.querySelector('#dropdown-content');

  dropdownBtn.addEventListener('click', toggleDropdown);

  function toggleDropdown(e) {
    e.preventDefault();
    if (!dropdownContent.style.display || dropdownContent.style.display === 'none') {
      dropdownContent.style.display = 'block';
    } else {
      dropdownContent.style.display = 'none';
    }
  }
});
