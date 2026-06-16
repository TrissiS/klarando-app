.class public Lb/b/q/f$a;
.super Ljava/lang/Object;
.source "AppCompatDrawableManager.java"

# interfaces
.implements Lb/b/q/w$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/b/q/f;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final a:[I

.field public final b:[I

.field public final c:[I

.field public final d:[I

.field public final e:[I

.field public final f:[I


# direct methods
.method public constructor <init>()V
    .registers 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    new-array v1, v0, [I

    .line 2
    sget v2, Lb/b/e;->abc_textfield_search_default_mtrl_alpha:I

    const/4 v3, 0x0

    aput v2, v1, v3

    sget v2, Lb/b/e;->abc_textfield_default_mtrl_alpha:I

    const/4 v4, 0x1

    aput v2, v1, v4

    sget v2, Lb/b/e;->abc_ab_share_pack_mtrl_alpha:I

    const/4 v5, 0x2

    aput v2, v1, v5

    iput-object v1, p0, Lb/b/q/f$a;->a:[I

    const/4 v1, 0x7

    new-array v2, v1, [I

    .line 3
    sget v6, Lb/b/e;->abc_ic_commit_search_api_mtrl_alpha:I

    aput v6, v2, v3

    sget v6, Lb/b/e;->abc_seekbar_tick_mark_material:I

    aput v6, v2, v4

    sget v6, Lb/b/e;->abc_ic_menu_share_mtrl_alpha:I

    aput v6, v2, v5

    sget v6, Lb/b/e;->abc_ic_menu_copy_mtrl_am_alpha:I

    aput v6, v2, v0

    sget v6, Lb/b/e;->abc_ic_menu_cut_mtrl_alpha:I

    const/4 v7, 0x4

    aput v6, v2, v7

    sget v6, Lb/b/e;->abc_ic_menu_selectall_mtrl_alpha:I

    const/4 v8, 0x5

    aput v6, v2, v8

    sget v6, Lb/b/e;->abc_ic_menu_paste_mtrl_am_alpha:I

    const/4 v9, 0x6

    aput v6, v2, v9

    iput-object v2, p0, Lb/b/q/f$a;->b:[I

    new-array v1, v1, [I

    .line 4
    sget v2, Lb/b/e;->abc_textfield_activated_mtrl_alpha:I

    aput v2, v1, v3

    sget v2, Lb/b/e;->abc_textfield_search_activated_mtrl_alpha:I

    aput v2, v1, v4

    sget v2, Lb/b/e;->abc_cab_background_top_mtrl_alpha:I

    aput v2, v1, v5

    sget v2, Lb/b/e;->abc_text_cursor_material:I

    aput v2, v1, v0

    sget v2, Lb/b/e;->abc_text_select_handle_left_mtrl:I

    aput v2, v1, v7

    sget v2, Lb/b/e;->abc_text_select_handle_middle_mtrl:I

    aput v2, v1, v8

    sget v2, Lb/b/e;->abc_text_select_handle_right_mtrl:I

    aput v2, v1, v9

    iput-object v1, p0, Lb/b/q/f$a;->c:[I

    new-array v1, v0, [I

    .line 5
    sget v2, Lb/b/e;->abc_popup_background_mtrl_mult:I

    aput v2, v1, v3

    sget v2, Lb/b/e;->abc_cab_background_internal_bg:I

    aput v2, v1, v4

    sget v2, Lb/b/e;->abc_menu_hardkey_panel_mtrl_mult:I

    aput v2, v1, v5

    iput-object v1, p0, Lb/b/q/f$a;->d:[I

    new-array v1, v5, [I

    .line 6
    sget v2, Lb/b/e;->abc_tab_indicator_material:I

    aput v2, v1, v3

    sget v2, Lb/b/e;->abc_textfield_search_material:I

    aput v2, v1, v4

    iput-object v1, p0, Lb/b/q/f$a;->e:[I

    new-array v1, v7, [I

    .line 7
    sget v2, Lb/b/e;->abc_btn_check_material:I

    aput v2, v1, v3

    sget v2, Lb/b/e;->abc_btn_radio_material:I

    aput v2, v1, v4

    sget v2, Lb/b/e;->abc_btn_check_material_anim:I

    aput v2, v1, v5

    sget v2, Lb/b/e;->abc_btn_radio_material_anim:I

    aput v2, v1, v0

    iput-object v1, p0, Lb/b/q/f$a;->f:[I

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lb/b/q/f$a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 4

    .line 16
    sget v0, Lb/b/e;->abc_edit_text_material:I

    if-ne p2, v0, :cond_b

    .line 17
    sget p2, Lb/b/c;->abc_tint_edittext:I

    invoke-static {p1, p2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 18
    :cond_b
    sget v0, Lb/b/e;->abc_switch_track_mtrl_alpha:I

    if-ne p2, v0, :cond_16

    .line 19
    sget p2, Lb/b/c;->abc_tint_switch_track:I

    invoke-static {p1, p2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 20
    :cond_16
    sget v0, Lb/b/e;->abc_switch_thumb_material:I

    if-ne p2, v0, :cond_1f

    .line 21
    invoke-virtual {p0, p1}, Lb/b/q/f$a;->d(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 22
    :cond_1f
    sget v0, Lb/b/e;->abc_btn_default_mtrl_shape:I

    if-ne p2, v0, :cond_28

    .line 23
    invoke-virtual {p0, p1}, Lb/b/q/f$a;->c(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 24
    :cond_28
    sget v0, Lb/b/e;->abc_btn_borderless_material:I

    if-ne p2, v0, :cond_31

    .line 25
    invoke-virtual {p0, p1}, Lb/b/q/f$a;->a(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 26
    :cond_31
    sget v0, Lb/b/e;->abc_btn_colored_material:I

    if-ne p2, v0, :cond_3a

    .line 27
    invoke-virtual {p0, p1}, Lb/b/q/f$a;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 28
    :cond_3a
    sget v0, Lb/b/e;->abc_spinner_mtrl_am_alpha:I

    if-eq p2, v0, :cond_7d

    sget v0, Lb/b/e;->abc_spinner_textfield_background_material:I

    if-ne p2, v0, :cond_43

    goto :goto_7d

    .line 29
    :cond_43
    iget-object v0, p0, Lb/b/q/f$a;->b:[I

    invoke-virtual {p0, v0, p2}, Lb/b/q/f$a;->a([II)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 30
    sget p2, Lb/b/a;->colorControlNormal:I

    invoke-static {p1, p2}, Lb/b/q/b0;->c(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 31
    :cond_52
    iget-object v0, p0, Lb/b/q/f$a;->e:[I

    invoke-virtual {p0, v0, p2}, Lb/b/q/f$a;->a([II)Z

    move-result v0

    if-eqz v0, :cond_61

    .line 32
    sget p2, Lb/b/c;->abc_tint_default:I

    invoke-static {p1, p2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 33
    :cond_61
    iget-object v0, p0, Lb/b/q/f$a;->f:[I

    invoke-virtual {p0, v0, p2}, Lb/b/q/f$a;->a([II)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 34
    sget p2, Lb/b/c;->abc_tint_btn_checkable:I

    invoke-static {p1, p2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    .line 35
    :cond_70
    sget v0, Lb/b/e;->abc_seekbar_thumb_material:I

    if-ne p2, v0, :cond_7b

    .line 36
    sget p2, Lb/b/c;->abc_tint_seek_thumb:I

    invoke-static {p1, p2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1

    :cond_7b
    const/4 p1, 0x0

    return-object p1

    .line 37
    :cond_7d
    :goto_7d
    sget p2, Lb/b/c;->abc_tint_spinner:I

    invoke-static {p1, p2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public a(I)Landroid/graphics/PorterDuff$Mode;
    .registers 3

    .line 53
    sget v0, Lb/b/e;->abc_switch_thumb_material:I

    if-ne p1, v0, :cond_7

    .line 54
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    goto :goto_8

    :cond_7
    const/4 p1, 0x0

    :goto_8
    return-object p1
.end method

.method public a(Lb/b/q/w;Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 7

    .line 2
    sget v0, Lb/b/e;->abc_cab_background_top_material:I

    if-ne p3, v0, :cond_1f

    .line 3
    new-instance p3, Landroid/graphics/drawable/LayerDrawable;

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    sget v2, Lb/b/e;->abc_cab_background_internal_bg:I

    .line 4
    invoke-virtual {p1, p2, v2}, Lb/b/q/w;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget v2, Lb/b/e;->abc_cab_background_top_mtrl_alpha:I

    .line 5
    invoke-virtual {p1, p2, v2}, Lb/b/q/w;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    aput-object p1, v0, v1

    invoke-direct {p3, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object p3

    .line 6
    :cond_1f
    sget v0, Lb/b/e;->abc_ratingbar_material:I

    if-ne p3, v0, :cond_2a

    .line 7
    sget p3, Lb/b/d;->abc_star_big:I

    invoke-virtual {p0, p1, p2, p3}, Lb/b/q/f$a;->b(Lb/b/q/w;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p1

    return-object p1

    .line 8
    :cond_2a
    sget v0, Lb/b/e;->abc_ratingbar_indicator_material:I

    if-ne p3, v0, :cond_35

    .line 9
    sget p3, Lb/b/d;->abc_star_medium:I

    invoke-virtual {p0, p1, p2, p3}, Lb/b/q/f$a;->b(Lb/b/q/w;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p1

    return-object p1

    .line 10
    :cond_35
    sget v0, Lb/b/e;->abc_ratingbar_small_material:I

    if-ne p3, v0, :cond_40

    .line 11
    sget p3, Lb/b/d;->abc_star_small:I

    invoke-virtual {p0, p1, p2, p3}, Lb/b/q/f$a;->b(Lb/b/q/w;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p1

    return-object p1

    :cond_40
    const/4 p1, 0x0

    return-object p1
.end method

.method public final a(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V
    .registers 5

    .line 12
    invoke-static {p1}, Lb/b/q/q;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 13
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :cond_a
    if-nez p3, :cond_10

    .line 14
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object p3

    :cond_10
    invoke-static {p2, p3}, Lb/b/q/f;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public a(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z
    .registers 10

    .line 38
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    .line 39
    iget-object v1, p0, Lb/b/q/f$a;->a:[I

    invoke-virtual {p0, v1, p2}, Lb/b/q/f$a;->a([II)Z

    move-result v1

    const v2, 0x1010031

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v1, :cond_17

    .line 40
    sget v2, Lb/b/a;->colorControlNormal:I

    :goto_14
    const/4 p2, -0x1

    :goto_15
    const/4 v1, 0x1

    goto :goto_44

    .line 41
    :cond_17
    iget-object v1, p0, Lb/b/q/f$a;->c:[I

    invoke-virtual {p0, v1, p2}, Lb/b/q/f$a;->a([II)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 42
    sget v2, Lb/b/a;->colorControlActivated:I

    goto :goto_14

    .line 43
    :cond_22
    iget-object v1, p0, Lb/b/q/f$a;->d:[I

    invoke-virtual {p0, v1, p2}, Lb/b/q/f$a;->a([II)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 44
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    goto :goto_14

    .line 45
    :cond_2d
    sget v1, Lb/b/e;->abc_list_divider_mtrl_alpha:I

    if-ne p2, v1, :cond_3c

    const v2, 0x1010030

    const p2, 0x42233333    # 40.8f

    .line 46
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    goto :goto_15

    .line 47
    :cond_3c
    sget v1, Lb/b/e;->abc_dialog_material_background:I

    if-ne p2, v1, :cond_41

    goto :goto_14

    :cond_41
    const/4 p2, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_44
    if-eqz v1, :cond_61

    .line 48
    invoke-static {p3}, Lb/b/q/q;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result v1

    if-eqz v1, :cond_50

    .line 49
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 50
    :cond_50
    invoke-static {p1, v2}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result p1

    .line 51
    invoke-static {p1, v0}, Lb/b/q/f;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    if-eq p2, v3, :cond_60

    .line 52
    invoke-virtual {p3, p2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_60
    return v5

    :cond_61
    return v4
.end method

.method public final a([II)Z
    .registers 7

    .line 15
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_e

    aget v3, p1, v2

    if-ne v3, p2, :cond_b

    const/4 p1, 0x1

    return p1

    :cond_b
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_e
    return v1
.end method

.method public final b(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    .line 1
    sget v0, Lb/b/a;->colorAccent:I

    .line 2
    invoke-static {p1, v0}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result v0

    .line 3
    invoke-virtual {p0, p1, v0}, Lb/b/q/f$a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public final b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 8

    const/4 v0, 0x4

    new-array v1, v0, [[I

    new-array v0, v0, [I

    .line 4
    sget v2, Lb/b/a;->colorControlHighlight:I

    invoke-static {p1, v2}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result v2

    .line 5
    sget v3, Lb/b/a;->colorButtonNormal:I

    invoke-static {p1, v3}, Lb/b/q/b0;->a(Landroid/content/Context;I)I

    move-result p1

    .line 6
    sget-object v3, Lb/b/q/b0;->b:[I

    const/4 v4, 0x0

    aput-object v3, v1, v4

    aput p1, v0, v4

    .line 7
    sget-object p1, Lb/b/q/b0;->d:[I

    const/4 v3, 0x1

    aput-object p1, v1, v3

    .line 8
    invoke-static {v2, p2}, Lb/h/f/a;->b(II)I

    move-result p1

    aput p1, v0, v3

    .line 9
    sget-object p1, Lb/b/q/b0;->c:[I

    const/4 v3, 0x2

    aput-object p1, v1, v3

    .line 10
    invoke-static {v2, p2}, Lb/h/f/a;->b(II)I

    move-result p1

    aput p1, v0, v3

    .line 11
    sget-object p1, Lb/b/q/b0;->f:[I

    const/4 v2, 0x3

    aput-object p1, v1, v2

    aput p2, v0, v2

    .line 12
    new-instance p1, Landroid/content/res/ColorStateList;

    invoke-direct {p1, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p1
.end method

.method public final b(Lb/b/q/w;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;
    .registers 8

    .line 13
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    .line 14
    sget v0, Lb/b/e;->abc_star_black_48dp:I

    invoke-virtual {p1, p2, v0}, Lb/b/q/w;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 15
    sget v1, Lb/b/e;->abc_star_half_black_48dp:I

    invoke-virtual {p1, p2, v1}, Lb/b/q/w;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 16
    instance-of p2, v0, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v1, 0x0

    if-eqz p2, :cond_31

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    if-ne p2, p3, :cond_31

    .line 17
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    if-ne p2, p3, :cond_31

    .line 18
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 19
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 20
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {p2, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_4d

    .line 21
    :cond_31
    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p3, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 22
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 23
    invoke-virtual {v0, v1, v1, p3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 24
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 25
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 26
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    move-object p2, v2

    .line 27
    :goto_4d
    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {p2, v2}, Landroid/graphics/drawable/BitmapDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 28
    instance-of v2, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v2, :cond_65

    .line 29
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    if-ne v2, p3, :cond_65

    .line 30
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    if-ne v2, p3, :cond_65

    .line 31
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    goto :goto_7b

    .line 32
    :cond_65
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p3, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 33
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 34
    invoke-virtual {p1, v1, v1, p3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 35
    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 36
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {p1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 37
    :goto_7b
    new-instance p3, Landroid/graphics/drawable/LayerDrawable;

    const/4 v2, 0x3

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v2, v1

    const/4 v0, 0x1

    aput-object p1, v2, v0

    const/4 p1, 0x2

    aput-object p2, v2, p1

    invoke-direct {p3, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/high16 p2, 0x1020000

    .line 38
    invoke-virtual {p3, v1, p2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    const p2, 0x102000f

    .line 39
    invoke-virtual {p3, v0, p2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    const p2, 0x102000d

    .line 40
    invoke-virtual {p3, p1, p2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    return-object p3
.end method

.method public b(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z
    .registers 9

    .line 41
    sget v0, Lb/b/e;->abc_seekbar_track_material:I

    const/4 v1, 0x1

    const v2, 0x102000d

    const v3, 0x102000f

    const/high16 v4, 0x1020000

    if-ne p2, v0, :cond_43

    .line 42
    check-cast p3, Landroid/graphics/drawable/LayerDrawable;

    .line 43
    invoke-virtual {p3, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget v0, Lb/b/a;->colorControlNormal:I

    .line 44
    invoke-static {p1, v0}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result v0

    .line 45
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object v4

    .line 46
    invoke-virtual {p0, p2, v0, v4}, Lb/b/q/f$a;->a(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 47
    invoke-virtual {p3, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget v0, Lb/b/a;->colorControlNormal:I

    .line 48
    invoke-static {p1, v0}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result v0

    .line 49
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object v3

    .line 50
    invoke-virtual {p0, p2, v0, v3}, Lb/b/q/f$a;->a(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 51
    invoke-virtual {p3, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget p3, Lb/b/a;->colorControlActivated:I

    .line 52
    invoke-static {p1, p3}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result p1

    .line 53
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object p3

    .line 54
    invoke-virtual {p0, p2, p1, p3}, Lb/b/q/f$a;->a(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    return v1

    .line 55
    :cond_43
    sget v0, Lb/b/e;->abc_ratingbar_material:I

    if-eq p2, v0, :cond_52

    sget v0, Lb/b/e;->abc_ratingbar_indicator_material:I

    if-eq p2, v0, :cond_52

    sget v0, Lb/b/e;->abc_ratingbar_small_material:I

    if-ne p2, v0, :cond_50

    goto :goto_52

    :cond_50
    const/4 p1, 0x0

    return p1

    .line 56
    :cond_52
    :goto_52
    check-cast p3, Landroid/graphics/drawable/LayerDrawable;

    .line 57
    invoke-virtual {p3, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget v0, Lb/b/a;->colorControlNormal:I

    .line 58
    invoke-static {p1, v0}, Lb/b/q/b0;->a(Landroid/content/Context;I)I

    move-result v0

    .line 59
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object v4

    .line 60
    invoke-virtual {p0, p2, v0, v4}, Lb/b/q/f$a;->a(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 61
    invoke-virtual {p3, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget v0, Lb/b/a;->colorControlActivated:I

    .line 62
    invoke-static {p1, v0}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result v0

    .line 63
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object v3

    .line 64
    invoke-virtual {p0, p2, v0, v3}, Lb/b/q/f$a;->a(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 65
    invoke-virtual {p3, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget p3, Lb/b/a;->colorControlActivated:I

    .line 66
    invoke-static {p1, p3}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result p1

    .line 67
    invoke-static {}, Lb/b/q/f;->a()Landroid/graphics/PorterDuff$Mode;

    move-result-object p3

    .line 68
    invoke-virtual {p0, p2, p1, p3}, Lb/b/q/f$a;->a(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    return v1
.end method

.method public final c(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    .line 1
    sget v0, Lb/b/a;->colorButtonNormal:I

    .line 2
    invoke-static {p1, v0}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result v0

    .line 3
    invoke-virtual {p0, p1, v0}, Lb/b/q/f$a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public final d(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 9

    const/4 v0, 0x3

    new-array v1, v0, [[I

    new-array v0, v0, [I

    .line 1
    sget v2, Lb/b/a;->colorSwitchThumbNormal:I

    invoke-static {p1, v2}, Lb/b/q/b0;->c(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_39

    .line 2
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v6

    if-eqz v6, :cond_39

    .line 3
    sget-object v6, Lb/b/q/b0;->b:[I

    aput-object v6, v1, v5

    .line 4
    aget-object v6, v1, v5

    invoke-virtual {v2, v6, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v6

    aput v6, v0, v5

    .line 5
    sget-object v5, Lb/b/q/b0;->e:[I

    aput-object v5, v1, v4

    .line 6
    sget v5, Lb/b/a;->colorControlActivated:I

    invoke-static {p1, v5}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result p1

    aput p1, v0, v4

    .line 7
    sget-object p1, Lb/b/q/b0;->f:[I

    aput-object p1, v1, v3

    .line 8
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    aput p1, v0, v3

    goto :goto_5d

    .line 9
    :cond_39
    sget-object v2, Lb/b/q/b0;->b:[I

    aput-object v2, v1, v5

    .line 10
    sget v2, Lb/b/a;->colorSwitchThumbNormal:I

    invoke-static {p1, v2}, Lb/b/q/b0;->a(Landroid/content/Context;I)I

    move-result v2

    aput v2, v0, v5

    .line 11
    sget-object v2, Lb/b/q/b0;->e:[I

    aput-object v2, v1, v4

    .line 12
    sget v2, Lb/b/a;->colorControlActivated:I

    invoke-static {p1, v2}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result v2

    aput v2, v0, v4

    .line 13
    sget-object v2, Lb/b/q/b0;->f:[I

    aput-object v2, v1, v3

    .line 14
    sget v2, Lb/b/a;->colorSwitchThumbNormal:I

    invoke-static {p1, v2}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result p1

    aput p1, v0, v3

    .line 15
    :goto_5d
    new-instance p1, Landroid/content/res/ColorStateList;

    invoke-direct {p1, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p1
.end method
