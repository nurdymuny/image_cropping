jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#image_avatar_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#image_avatar_crop_x').val(coords.x)
    $('#image_avatar_crop_y').val(coords.y)
    $('#image_avatar_crop_w').val(coords.w)
    $('#image_avatar_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#image_avatar_previewbox').css
      width: Math.round(100/coords.w * $('#image_avatar_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#image_avatar_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
