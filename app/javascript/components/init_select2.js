import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
};

export { initSelect2 };

const placeholderSelect2 = () => {
  $(".placeholder").select2({
      placeholder: "Type names here"
  });
}

export { placeholderSelect2 };
