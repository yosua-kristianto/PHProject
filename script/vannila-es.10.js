function readName(input)
{
    if(input.files && input.files[0])
    {
        var reader = new FileReader();

        reader.onload = function(e){
            jQuery('.imageBox').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

jQuery("#foto").change(function(){
    readName(this);
});