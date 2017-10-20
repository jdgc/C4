
  const startYear = document.querySelector('#rental_start_date_li').value;
  const startMonth = document.querySelector('#rental_start_date_2i').value;
  const startDay = document.querySelector('#rental_start_date_3i').value;

  const endYear = document.querySelector('#rental_end_date_li').value;
  const endMonth = document.querySelector('#rental_end_date_2li').value;
  const endDay = document.querySelector('#rental_end_date_3li').value;

  function calcuateRentPrice(startY, startM, startD, endY, endM, endD){
    const start_date = ((startY * 525600) + (startM * 43800) + (startD * 1440) / 1440);
    const end_date = ((endY * 525600) + (endM * 43800) + (endD * 1440) / 1440);
    return ((end_date - start_date) / 86400)
  };


  document.querySelector('#new_rental')addEventListener('change', {
    calcuateRentPrice(startYear, startMonth, startDay, endYear, endMonth, endDay)
 });


