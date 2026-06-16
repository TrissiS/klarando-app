.class public Lb/b/q/h;
.super Ljava/lang/Object;
.source "AppCompatImageHelper.java"


# instance fields
.field public final a:Landroid/widget/ImageView;

.field public b:Lb/b/q/e0;

.field public c:Lb/b/q/e0;

.field public d:Lb/b/q/e0;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 4

    .line 36
    iget-object v0, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 37
    invoke-static {v0}, Lb/b/q/q;->b(Landroid/graphics/drawable/Drawable;)V

    :cond_b
    if-eqz v0, :cond_35

    .line 38
    invoke-virtual {p0}, Lb/b/q/h;->e()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 39
    invoke-virtual {p0, v0}, Lb/b/q/h;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result v1

    if-eqz v1, :cond_1a

    return-void

    .line 40
    :cond_1a
    iget-object v1, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    if-eqz v1, :cond_28

    .line 41
    iget-object v2, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    .line 42
    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawableState()[I

    move-result-object v2

    .line 43
    invoke-static {v0, v1, v2}, Lb/b/q/f;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V

    goto :goto_35

    .line 44
    :cond_28
    iget-object v1, p0, Lb/b/q/h;->b:Lb/b/q/e0;

    if-eqz v1, :cond_35

    .line 45
    iget-object v2, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    .line 46
    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawableState()[I

    move-result-object v2

    .line 47
    invoke-static {v0, v1, v2}, Lb/b/q/f;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V

    :cond_35
    :goto_35
    return-void
.end method

.method public a(I)V
    .registers 3

    if-eqz p1, :cond_17

    .line 21
    iget-object v0, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 22
    invoke-static {p1}, Lb/b/q/q;->b(Landroid/graphics/drawable/Drawable;)V

    .line 23
    :cond_11
    iget-object v0, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1d

    .line 24
    :cond_17
    iget-object p1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 25
    :goto_1d
    invoke-virtual {p0}, Lb/b/q/h;->a()V

    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 26
    iget-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 27
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    .line 28
    :cond_b
    iget-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    iput-object p1, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    const/4 p1, 0x1

    .line 29
    iput-boolean p1, v0, Lb/b/q/e0;->d:Z

    .line 30
    invoke-virtual {p0}, Lb/b/q/h;->a()V

    return-void
.end method

.method public a(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 31
    iget-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 32
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    .line 33
    :cond_b
    iget-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    iput-object p1, v0, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    const/4 p1, 0x1

    .line 34
    iput-boolean p1, v0, Lb/b/q/e0;->c:Z

    .line 35
    invoke-virtual {p0}, Lb/b/q/h;->a()V

    return-void
.end method

.method public a(Landroid/util/AttributeSet;I)V
    .registers 11

    .line 1
    iget-object v0, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lb/b/j;->AppCompatImageView:[I

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, p2, v2}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Lb/b/q/g0;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lb/b/j;->AppCompatImageView:[I

    .line 3
    invoke-virtual {v0}, Lb/b/q/g0;->a()Landroid/content/res/TypedArray;

    move-result-object v5

    const/4 v7, 0x0

    move-object v4, p1

    move v6, p2

    .line 4
    invoke-static/range {v1 .. v7}, Lb/h/m/y;->a(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 5
    :try_start_1f
    iget-object p1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/4 p2, -0x1

    if-nez p1, :cond_41

    .line 6
    sget v1, Lb/b/j;->AppCompatImageView_srcCompat:I

    invoke-virtual {v0, v1, p2}, Lb/b/q/g0;->g(II)I

    move-result v1

    if-eq v1, p2, :cond_41

    .line 7
    iget-object p1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_41

    .line 8
    iget-object v1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_41
    if-eqz p1, :cond_46

    .line 9
    invoke-static {p1}, Lb/b/q/q;->b(Landroid/graphics/drawable/Drawable;)V

    .line 10
    :cond_46
    sget p1, Lb/b/j;->AppCompatImageView_tint:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_59

    .line 11
    iget-object p1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    sget v1, Lb/b/j;->AppCompatImageView_tint:I

    .line 12
    invoke-virtual {v0, v1}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 13
    invoke-static {p1, v1}, Lb/h/n/e;->a(Landroid/widget/ImageView;Landroid/content/res/ColorStateList;)V

    .line 14
    :cond_59
    sget p1, Lb/b/j;->AppCompatImageView_tintMode:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_71

    .line 15
    iget-object p1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    sget v1, Lb/b/j;->AppCompatImageView_tintMode:I

    .line 16
    invoke-virtual {v0, v1, p2}, Lb/b/q/g0;->d(II)I

    move-result p2

    const/4 v1, 0x0

    .line 17
    invoke-static {p2, v1}, Lb/b/q/q;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p2

    .line 18
    invoke-static {p1, p2}, Lb/h/n/e;->a(Landroid/widget/ImageView;Landroid/graphics/PorterDuff$Mode;)V
    :try_end_71
    .catchall {:try_start_1f .. :try_end_71} :catchall_75

    .line 19
    :cond_71
    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    return-void

    :catchall_75
    move-exception p1

    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    .line 20
    throw p1
.end method

.method public final a(Landroid/graphics/drawable/Drawable;)Z
    .registers 5

    .line 48
    iget-object v0, p0, Lb/b/q/h;->d:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 49
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/h;->d:Lb/b/q/e0;

    .line 50
    :cond_b
    iget-object v0, p0, Lb/b/q/h;->d:Lb/b/q/e0;

    .line 51
    invoke-virtual {v0}, Lb/b/q/e0;->a()V

    .line 52
    iget-object v1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-static {v1}, Lb/h/n/e;->a(Landroid/widget/ImageView;)Landroid/content/res/ColorStateList;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1d

    .line 53
    iput-boolean v2, v0, Lb/b/q/e0;->d:Z

    .line 54
    iput-object v1, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    .line 55
    :cond_1d
    iget-object v1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-static {v1}, Lb/h/n/e;->b(Landroid/widget/ImageView;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v1

    if-eqz v1, :cond_29

    .line 56
    iput-boolean v2, v0, Lb/b/q/e0;->c:Z

    .line 57
    iput-object v1, v0, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    .line 58
    :cond_29
    iget-boolean v1, v0, Lb/b/q/e0;->d:Z

    if-nez v1, :cond_34

    iget-boolean v1, v0, Lb/b/q/e0;->c:Z

    if-eqz v1, :cond_32

    goto :goto_34

    :cond_32
    const/4 p1, 0x0

    return p1

    .line 59
    :cond_34
    :goto_34
    iget-object v1, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawableState()[I

    move-result-object v1

    invoke-static {p1, v0, v1}, Lb/b/q/f;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V

    return v2
.end method

.method public b()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    if-eqz v0, :cond_7

    iget-object v0, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public c()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h;->c:Lb/b/q/e0;

    if-eqz v0, :cond_7

    iget-object v0, v0, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public d()Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/b/q/h;->a:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_12

    instance-of v0, v0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    return v0

    :cond_12
    const/4 v0, 0x1

    return v0
.end method

.method public final e()Z
    .registers 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v3, 0x15

    if-le v0, v3, :cond_f

    .line 2
    iget-object v0, p0, Lb/b/q/h;->b:Lb/b/q/e0;

    if-eqz v0, :cond_d

    goto :goto_e

    :cond_d
    const/4 v1, 0x0

    :goto_e
    return v1

    :cond_f
    if-ne v0, v3, :cond_12

    return v1

    :cond_12
    return v2
.end method
