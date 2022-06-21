$(function(){
  $dropdown=$("#dropdown");
  $dropdownButton=$("#dropdown > button");
  $dropdownItems=$("#dropdown > div.dropdown-menu > .dropdown-item");
  $dropdownItems.each(function(){
    $(this).click(handleDropdownClick);
  });

  $buttons=$(".updatemenu-button");
  console.log($dropdown,$dropdownButton,$dropdownItems);
});

buttonMap = {
"2012": 0,
"2016": 1,
"2020": 2
};
handleDropdownClick=function(e,t){
 year=$(this).text();
 $("#dropdown > button").text(year);
 $buttons[buttonMap[year]].dispatchEvent(new Event("click"));
 console.log($buttons[buttonMap[year]]);
};
