from django import template
from sorl.thumbnail import get_thumbnail

register = template.Library()


@register.filter(name='page_attrs', is_safe=True)
def page_attrs(model):
    """Removes all values of arg from the given string"""
    if model.video and model.use_video:
        # TODO: process link and get video ID
        return "data-url='" + model.video + "'"
    else:
        if model.image and model.image.file:
            image = get_thumbnail(model.image.file, '1000', crop='center', quality=75)
            if image:
                output = ["style=\"background-repeat: no-repeat, no-repeat;",
                          "background-position: center center, center center;", "background-size: auto, cover;",
                          "background-image: radial-gradient(transparent 0%, transparent 15%, rgba(0,0,0, 0.85))",
                          ", url(" + image.url + ");\""]
                return ''.join(output)
        return ''

