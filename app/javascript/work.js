document.addEventListener("turbo:load", () => {

  console.log("WORK JS LOADED");

  let currentIndex = 0;

  const nextButton =
    document.getElementById("next-button");

  const prevButton =
    document.getElementById("prev-button");

  if (!nextButton || !prevButton) {
    console.log("BUTTONS NOT FOUND");
    return;
  }

  console.log("BUTTONS FOUND");

  const themeSelect =
    document.getElementById("theme-select");

  const getThemeId = () => themeSelect.value;

  const currentLocale =
  window.location.pathname.split("/")[1] || "ru";

  // NEXT IMAGE
  nextButton.addEventListener("click", async () => {

    console.log("NEXT CLICK");

    const response = await fetch(
      `/${currentLocale}/api/next_image?theme_id=${getThemeId()}&index=${currentIndex}`
    );

    const data = await response.json();

    console.log(data);

    currentIndex = data.index;

    document.getElementById("image-name").innerText =
      data.name;

    document.getElementById("main-image").src =
      `/pictures/${data.file}`;

    // UPDATE RATINGS
    document.getElementById(
      "average-rating"
    ).innerText = data.average;

    document.getElementById(
      "my-rating"
    ).innerText =
      data.my_value || "-";

    // UPDATE IMAGE ID
    document.querySelectorAll(".rate-button")
      .forEach(button => {

        button.dataset.imageId =
          data.image_id;

      });

  });

  // PREV IMAGE
  prevButton.addEventListener("click", async () => {

    console.log("PREV CLICK");

    const response = await fetch(
      `/${currentLocale}/api/prev_image?theme_id=${getThemeId()}&index=${currentIndex}`
    );

    const data = await response.json();

    console.log(data);

    currentIndex = data.index;

    document.getElementById("image-name").innerText =
      data.name;

    document.getElementById("main-image").src =
      `/pictures/${data.file}`;

    // UPDATE RATINGS
    document.getElementById(
      "average-rating"
    ).innerText = data.average;

    document.getElementById(
      "my-rating"
    ).innerText =
      data.my_value || "-";

    // UPDATE IMAGE ID
    document.querySelectorAll(".rate-button")
      .forEach(button => {

        button.dataset.imageId =
          data.image_id;

      });

  });

  // RATING BUTTONS
  document.querySelectorAll(".rate-button")
    .forEach(button => {

      button.addEventListener("click", async () => {

        const value =
          button.dataset.value;

        const imageId =
          button.dataset.imageId;

        const response = await fetch(
          `/${currentLocale}/api/rate_image`,
          {
            method: "POST",

            headers: {
              "Content-Type": "application/json",
              "X-CSRF-Token":
                document.querySelector(
                  'meta[name="csrf-token"]'
                ).content
            },

            body: JSON.stringify({
              image_id: imageId,
              value: value
            })
          }
        );

        const data = await response.json();

        document.getElementById(
          "average-rating"
        ).innerText = data.average;

        document.getElementById(
          "my-rating"
        ).innerText = data.my_value;

      });

  });

});