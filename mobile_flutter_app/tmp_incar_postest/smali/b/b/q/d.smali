.class public Lb/b/q/d;
.super Ljava/lang/Object;
.source "AppCompatBackgroundHelper.java"


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Lb/b/q/f;

.field public c:I

.field public d:Lb/b/q/e0;

.field public e:Lb/b/q/e0;

.field public f:Lb/b/q/e0;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/b/q/d;->c:I

    .line 3
    iput-object p1, p0, Lb/b/q/d;->a:Landroid/view/View;

    .line 4
    invoke-static {}, Lb/b/q/f;->b()Lb/b/q/f;

    move-result-object p1

    iput-object p1, p0, Lb/b/q/d;->b:Lb/b/q/f;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 4

    .line 31
    iget-object v0, p0, Lb/b/q/d;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_30

    .line 32
    invoke-virtual {p0}, Lb/b/q/d;->d()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 33
    invoke-virtual {p0, v0}, Lb/b/q/d;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result v1

    if-eqz v1, :cond_15

    return-void

    .line 34
    :cond_15
    iget-object v1, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    if-eqz v1, :cond_23

    .line 35
    iget-object v2, p0, Lb/b/q/d;->a:Landroid/view/View;

    .line 36
    invoke-virtual {v2}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    .line 37
    invoke-static {v0, v1, v2}, Lb/b/q/f;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V

    goto :goto_30

    .line 38
    :cond_23
    iget-object v1, p0, Lb/b/q/d;->d:Lb/b/q/e0;

    if-eqz v1, :cond_30

    .line 39
    iget-object v2, p0, Lb/b/q/d;->a:Landroid/view/View;

    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    .line 41
    invoke-static {v0, v1, v2}, Lb/b/q/f;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V

    :cond_30
    :goto_30
    return-void
.end method

.method public a(I)V
    .registers 4

    .line 21
    iput p1, p0, Lb/b/q/d;->c:I

    .line 22
    iget-object v0, p0, Lb/b/q/d;->b:Lb/b/q/f;

    if-eqz v0, :cond_11

    .line 23
    iget-object v1, p0, Lb/b/q/d;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lb/b/q/f;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    .line 24
    :goto_12
    invoke-virtual {p0, p1}, Lb/b/q/d;->a(Landroid/content/res/ColorStateList;)V

    .line 25
    invoke-virtual {p0}, Lb/b/q/d;->a()V

    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;)V
    .registers 3

    if-eqz p1, :cond_15

    .line 42
    iget-object v0, p0, Lb/b/q/d;->d:Lb/b/q/e0;

    if-nez v0, :cond_d

    .line 43
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/d;->d:Lb/b/q/e0;

    .line 44
    :cond_d
    iget-object v0, p0, Lb/b/q/d;->d:Lb/b/q/e0;

    iput-object p1, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    const/4 p1, 0x1

    .line 45
    iput-boolean p1, v0, Lb/b/q/e0;->d:Z

    goto :goto_18

    :cond_15
    const/4 p1, 0x0

    .line 46
    iput-object p1, p0, Lb/b/q/d;->d:Lb/b/q/e0;

    .line 47
    :goto_18
    invoke-virtual {p0}, Lb/b/q/d;->a()V

    return-void
.end method

.method public a(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 26
    iget-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 27
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    .line 28
    :cond_b
    iget-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    iput-object p1, v0, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    const/4 p1, 0x1

    .line 29
    iput-boolean p1, v0, Lb/b/q/e0;->c:Z

    .line 30
    invoke-virtual {p0}, Lb/b/q/d;->a()V

    return-void
.end method

.method public a(Landroid/util/AttributeSet;I)V
    .registers 11

    .line 1
    iget-object v0, p0, Lb/b/q/d;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lb/b/j;->ViewBackgroundHelper:[I

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, p2, v2}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Lb/b/q/g0;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lb/b/q/d;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lb/b/j;->ViewBackgroundHelper:[I

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
    sget p1, Lb/b/j;->ViewBackgroundHelper_android_background:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    const/4 p2, -0x1

    if-eqz p1, :cond_43

    .line 6
    sget p1, Lb/b/j;->ViewBackgroundHelper_android_background:I

    invoke-virtual {v0, p1, p2}, Lb/b/q/g0;->g(II)I

    move-result p1

    iput p1, p0, Lb/b/q/d;->c:I

    .line 7
    iget-object p1, p0, Lb/b/q/d;->b:Lb/b/q/f;

    iget-object v1, p0, Lb/b/q/d;->a:Landroid/view/View;

    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lb/b/q/d;->c:I

    invoke-virtual {p1, v1, v2}, Lb/b/q/f;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    if-eqz p1, :cond_43

    .line 9
    invoke-virtual {p0, p1}, Lb/b/q/d;->a(Landroid/content/res/ColorStateList;)V

    .line 10
    :cond_43
    sget p1, Lb/b/j;->ViewBackgroundHelper_backgroundTint:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_56

    .line 11
    iget-object p1, p0, Lb/b/q/d;->a:Landroid/view/View;

    sget v1, Lb/b/j;->ViewBackgroundHelper_backgroundTint:I

    .line 12
    invoke-virtual {v0, v1}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 13
    invoke-static {p1, v1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/content/res/ColorStateList;)V

    .line 14
    :cond_56
    sget p1, Lb/b/j;->ViewBackgroundHelper_backgroundTintMode:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_6e

    .line 15
    iget-object p1, p0, Lb/b/q/d;->a:Landroid/view/View;

    sget v1, Lb/b/j;->ViewBackgroundHelper_backgroundTintMode:I

    .line 16
    invoke-virtual {v0, v1, p2}, Lb/b/q/g0;->d(II)I

    move-result p2

    const/4 v1, 0x0

    .line 17
    invoke-static {p2, v1}, Lb/b/q/q;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p2

    .line 18
    invoke-static {p1, p2}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    :try_end_6e
    .catchall {:try_start_1f .. :try_end_6e} :catchall_72

    .line 19
    :cond_6e
    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    return-void

    :catchall_72
    move-exception p1

    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    .line 20
    throw p1
.end method

.method public final a(Landroid/graphics/drawable/Drawable;)Z
    .registers 5

    .line 48
    iget-object v0, p0, Lb/b/q/d;->f:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 49
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/d;->f:Lb/b/q/e0;

    .line 50
    :cond_b
    iget-object v0, p0, Lb/b/q/d;->f:Lb/b/q/e0;

    .line 51
    invoke-virtual {v0}, Lb/b/q/e0;->a()V

    .line 52
    iget-object v1, p0, Lb/b/q/d;->a:Landroid/view/View;

    invoke-static {v1}, Lb/h/m/y;->i(Landroid/view/View;)Landroid/content/res/ColorStateList;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1d

    .line 53
    iput-boolean v2, v0, Lb/b/q/e0;->d:Z

    .line 54
    iput-object v1, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    .line 55
    :cond_1d
    iget-object v1, p0, Lb/b/q/d;->a:Landroid/view/View;

    invoke-static {v1}, Lb/h/m/y;->j(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;

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
    iget-object v1, p0, Lb/b/q/d;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    invoke-static {p1, v0, v1}, Lb/b/q/f;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V

    return v2
.end method

.method public b()Landroid/content/res/ColorStateList;
    .registers 2

    .line 9
    iget-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    if-eqz v0, :cond_7

    iget-object v0, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public b(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 4
    iget-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 5
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    .line 6
    :cond_b
    iget-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    iput-object p1, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    const/4 p1, 0x1

    .line 7
    iput-boolean p1, v0, Lb/b/q/e0;->d:Z

    .line 8
    invoke-virtual {p0}, Lb/b/q/d;->a()V

    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    const/4 p1, -0x1

    .line 1
    iput p1, p0, Lb/b/q/d;->c:I

    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lb/b/q/d;->a(Landroid/content/res/ColorStateList;)V

    .line 3
    invoke-virtual {p0}, Lb/b/q/d;->a()V

    return-void
.end method

.method public c()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/d;->e:Lb/b/q/e0;

    if-eqz v0, :cond_7

    iget-object v0, v0, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public final d()Z
    .registers 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v3, 0x15

    if-le v0, v3, :cond_f

    .line 2
    iget-object v0, p0, Lb/b/q/d;->d:Lb/b/q/e0;

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
