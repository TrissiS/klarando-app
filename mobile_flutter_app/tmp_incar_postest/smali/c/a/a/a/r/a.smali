.class public Lc/a/a/a/r/a;
.super Ljava/lang/Object;
.source "MaterialButtonHelper.java"


# static fields
.field public static final t:Z


# instance fields
.field public final a:Lcom/google/android/material/button/MaterialButton;

.field public b:Lc/a/a/a/l0/m;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/graphics/PorterDuff$Mode;

.field public j:Landroid/content/res/ColorStateList;

.field public k:Landroid/content/res/ColorStateList;

.field public l:Landroid/content/res/ColorStateList;

.field public m:Landroid/graphics/drawable/Drawable;

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Landroid/graphics/drawable/LayerDrawable;

.field public s:I


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    sput-boolean v0, Lc/a/a/a/r/a;->t:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/button/MaterialButton;Lc/a/a/a/l0/m;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lc/a/a/a/r/a;->n:Z

    .line 3
    iput-boolean v0, p0, Lc/a/a/a/r/a;->o:Z

    .line 4
    iput-boolean v0, p0, Lc/a/a/a/r/a;->p:Z

    .line 5
    iput-object p1, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    .line 6
    iput-object p2, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    return-void
.end method


# virtual methods
.method public final a()Landroid/graphics/drawable/Drawable;
    .registers 9

    .line 39
    new-instance v0, Lc/a/a/a/l0/h;

    iget-object v1, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    invoke-direct {v0, v1}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    .line 40
    iget-object v1, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 42
    iget-object v1, p0, Lc/a/a/a/r/a;->j:Landroid/content/res/ColorStateList;

    invoke-static {v0, v1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 43
    iget-object v1, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    if-eqz v1, :cond_1c

    .line 44
    invoke-static {v0, v1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 45
    :cond_1c
    iget v1, p0, Lc/a/a/a/r/a;->h:I

    int-to-float v1, v1

    iget-object v2, p0, Lc/a/a/a/r/a;->k:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1, v2}, Lc/a/a/a/l0/h;->a(FLandroid/content/res/ColorStateList;)V

    .line 46
    new-instance v1, Lc/a/a/a/l0/h;

    iget-object v2, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    invoke-direct {v1, v2}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    const/4 v2, 0x0

    .line 47
    invoke-virtual {v1, v2}, Lc/a/a/a/l0/h;->setTint(I)V

    .line 48
    iget v3, p0, Lc/a/a/a/r/a;->h:I

    int-to-float v3, v3

    iget-boolean v4, p0, Lc/a/a/a/r/a;->n:Z

    if-eqz v4, :cond_3f

    iget-object v4, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    sget v5, Lc/a/a/a/b;->colorSurface:I

    .line 49
    invoke-static {v4, v5}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result v4

    goto :goto_40

    :cond_3f
    const/4 v4, 0x0

    .line 50
    :goto_40
    invoke-virtual {v1, v3, v4}, Lc/a/a/a/l0/h;->a(FI)V

    .line 51
    sget-boolean v3, Lc/a/a/a/r/a;->t:Z

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v3, :cond_75

    .line 52
    new-instance v3, Lc/a/a/a/l0/h;

    iget-object v6, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    invoke-direct {v3, v6}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    iput-object v3, p0, Lc/a/a/a/r/a;->m:Landroid/graphics/drawable/Drawable;

    const/4 v6, -0x1

    .line 53
    invoke-static {v3, v6}, Lb/h/f/l/a;->b(Landroid/graphics/drawable/Drawable;I)V

    .line 54
    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    iget-object v6, p0, Lc/a/a/a/r/a;->l:Landroid/content/res/ColorStateList;

    .line 55
    invoke-static {v6}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v6

    new-instance v7, Landroid/graphics/drawable/LayerDrawable;

    new-array v4, v4, [Landroid/graphics/drawable/Drawable;

    aput-object v1, v4, v2

    aput-object v0, v4, v5

    invoke-direct {v7, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 56
    invoke-virtual {p0, v7}, Lc/a/a/a/r/a;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/InsetDrawable;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/r/a;->m:Landroid/graphics/drawable/Drawable;

    invoke-direct {v3, v6, v0, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object v3, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    return-object v3

    .line 57
    :cond_75
    new-instance v3, Lc/a/a/a/j0/a;

    iget-object v6, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    invoke-direct {v3, v6}, Lc/a/a/a/j0/a;-><init>(Lc/a/a/a/l0/m;)V

    iput-object v3, p0, Lc/a/a/a/r/a;->m:Landroid/graphics/drawable/Drawable;

    .line 58
    iget-object v6, p0, Lc/a/a/a/r/a;->l:Landroid/content/res/ColorStateList;

    .line 59
    invoke-static {v6}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v6

    .line 60
    invoke-static {v3, v6}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 61
    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    const/4 v6, 0x3

    new-array v6, v6, [Landroid/graphics/drawable/Drawable;

    aput-object v1, v6, v2

    aput-object v0, v6, v5

    iget-object v0, p0, Lc/a/a/a/r/a;->m:Landroid/graphics/drawable/Drawable;

    aput-object v0, v6, v4

    invoke-direct {v3, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object v3, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    .line 62
    invoke-virtual {p0, v3}, Lc/a/a/a/r/a;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/InsetDrawable;

    move-result-object v0

    return-object v0
.end method

.method public final a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/InsetDrawable;
    .registers 9

    .line 34
    new-instance v6, Landroid/graphics/drawable/InsetDrawable;

    iget v2, p0, Lc/a/a/a/r/a;->c:I

    iget v3, p0, Lc/a/a/a/r/a;->e:I

    iget v4, p0, Lc/a/a/a/r/a;->d:I

    iget v5, p0, Lc/a/a/a/r/a;->f:I

    move-object v0, v6

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    return-object v6
.end method

.method public final a(Z)Lc/a/a/a/l0/h;
    .registers 4

    .line 74
    iget-object v0, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    if-lez v0, :cond_31

    .line 75
    sget-boolean v0, Lc/a/a/a/r/a;->t:Z

    if-eqz v0, :cond_26

    .line 76
    iget-object v0, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/InsetDrawable;

    .line 77
    invoke-virtual {v0}, Landroid/graphics/drawable/InsetDrawable;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    xor-int/lit8 p1, p1, 0x1

    .line 78
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Lc/a/a/a/l0/h;

    return-object p1

    .line 79
    :cond_26
    iget-object v0, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    xor-int/lit8 p1, p1, 0x1

    .line 80
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Lc/a/a/a/l0/h;

    return-object p1

    :cond_31
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(I)V
    .registers 3

    .line 63
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 64
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setTint(I)V

    :cond_d
    return-void
.end method

.method public final a(II)V
    .registers 10

    .line 83
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result v0

    .line 84
    iget-object v1, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1}, Landroid/widget/Button;->getPaddingTop()I

    move-result v1

    .line 85
    iget-object v2, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v2}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v2

    .line 86
    iget-object v3, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v3}, Landroid/widget/Button;->getPaddingBottom()I

    move-result v3

    .line 87
    iget v4, p0, Lc/a/a/a/r/a;->e:I

    .line 88
    iget v5, p0, Lc/a/a/a/r/a;->f:I

    .line 89
    iput p2, p0, Lc/a/a/a/r/a;->f:I

    .line 90
    iput p1, p0, Lc/a/a/a/r/a;->e:I

    .line 91
    iget-boolean v6, p0, Lc/a/a/a/r/a;->o:Z

    if-nez v6, :cond_27

    .line 92
    invoke-virtual {p0}, Lc/a/a/a/r/a;->q()V

    .line 93
    :cond_27
    iget-object v6, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    add-int/2addr v1, p1

    sub-int/2addr v1, v4

    add-int/2addr v3, p2

    sub-int/2addr v3, v5

    invoke-static {v6, v0, v1, v2, v3}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 65
    iget-object v0, p0, Lc/a/a/a/r/a;->l:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_41

    .line 66
    iput-object p1, p0, Lc/a/a/a/r/a;->l:Landroid/content/res/ColorStateList;

    .line 67
    sget-boolean v0, Lc/a/a/a/r/a;->t:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_24

    .line 68
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/RippleDrawable;

    .line 69
    invoke-static {p1}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    goto :goto_41

    .line 70
    :cond_24
    sget-boolean v0, Lc/a/a/a/r/a;->t:Z

    if-nez v0, :cond_41

    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lc/a/a/a/j0/a;

    if-eqz v0, :cond_41

    .line 71
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/j0/a;

    .line 72
    invoke-static {p1}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 73
    invoke-virtual {v0, p1}, Lc/a/a/a/j0/a;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_41
    :goto_41
    return-void
.end method

.method public a(Landroid/content/res/TypedArray;)V
    .registers 7

    .line 1
    sget v0, Lc/a/a/a/l;->MaterialButton_android_insetLeft:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/r/a;->c:I

    .line 2
    sget v0, Lc/a/a/a/l;->MaterialButton_android_insetRight:I

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/r/a;->d:I

    .line 4
    sget v0, Lc/a/a/a/l;->MaterialButton_android_insetTop:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/r/a;->e:I

    .line 5
    sget v0, Lc/a/a/a/l;->MaterialButton_android_insetBottom:I

    .line 6
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/r/a;->f:I

    .line 7
    sget v0, Lc/a/a/a/l;->MaterialButton_cornerRadius:I

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    const/4 v2, -0x1

    if-eqz v0, :cond_3f

    .line 8
    sget v0, Lc/a/a/a/l;->MaterialButton_cornerRadius:I

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/r/a;->g:I

    .line 9
    iget-object v3, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    int-to-float v0, v0

    invoke-virtual {v3, v0}, Lc/a/a/a/l0/m;->a(F)Lc/a/a/a/l0/m;

    move-result-object v0

    invoke-virtual {p0, v0}, Lc/a/a/a/r/a;->a(Lc/a/a/a/l0/m;)V

    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lc/a/a/a/r/a;->p:Z

    .line 11
    :cond_3f
    sget v0, Lc/a/a/a/l;->MaterialButton_strokeWidth:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/r/a;->h:I

    .line 12
    sget v0, Lc/a/a/a/l;->MaterialButton_backgroundTintMode:I

    .line 13
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 14
    invoke-static {v0, v2}, Lc/a/a/a/d0/t;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    .line 15
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    .line 16
    invoke-virtual {v0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lc/a/a/a/l;->MaterialButton_backgroundTint:I

    .line 17
    invoke-static {v0, p1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/r/a;->j:Landroid/content/res/ColorStateList;

    .line 18
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    .line 19
    invoke-virtual {v0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lc/a/a/a/l;->MaterialButton_strokeColor:I

    .line 20
    invoke-static {v0, p1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/r/a;->k:Landroid/content/res/ColorStateList;

    .line 21
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    .line 22
    invoke-virtual {v0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lc/a/a/a/l;->MaterialButton_rippleColor:I

    .line 23
    invoke-static {v0, p1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/r/a;->l:Landroid/content/res/ColorStateList;

    .line 24
    sget v0, Lc/a/a/a/l;->MaterialButton_android_checkable:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lc/a/a/a/r/a;->q:Z

    .line 25
    sget v0, Lc/a/a/a/l;->MaterialButton_elevation:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/r/a;->s:I

    .line 26
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result v0

    .line 27
    iget-object v1, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1}, Landroid/widget/Button;->getPaddingTop()I

    move-result v1

    .line 28
    iget-object v2, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v2}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v2

    .line 29
    iget-object v3, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v3}, Landroid/widget/Button;->getPaddingBottom()I

    move-result v3

    .line 30
    sget v4, Lc/a/a/a/l;->MaterialButton_android_background:I

    invoke-virtual {p1, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_b3

    .line 31
    invoke-virtual {p0}, Lc/a/a/a/r/a;->p()V

    goto :goto_b6

    .line 32
    :cond_b3
    invoke-virtual {p0}, Lc/a/a/a/r/a;->q()V

    .line 33
    :goto_b6
    iget-object p1, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    iget v4, p0, Lc/a/a/a/r/a;->c:I

    add-int/2addr v0, v4

    iget v4, p0, Lc/a/a/a/r/a;->e:I

    add-int/2addr v1, v4

    iget v4, p0, Lc/a/a/a/r/a;->d:I

    add-int/2addr v2, v4

    iget v4, p0, Lc/a/a/a/r/a;->f:I

    add-int/2addr v3, v4

    invoke-static {p1, v0, v1, v2, v3}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    return-void
.end method

.method public a(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 35
    iget-object v0, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_19

    .line 36
    iput-object p1, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    .line 37
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object p1

    if-eqz p1, :cond_19

    iget-object p1, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    if-eqz p1, :cond_19

    .line 38
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object p1

    iget-object v0, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    :cond_19
    return-void
.end method

.method public a(Lc/a/a/a/l0/m;)V
    .registers 2

    .line 81
    iput-object p1, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    .line 82
    invoke-virtual {p0, p1}, Lc/a/a/a/r/a;->b(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public b()I
    .registers 2

    .line 10
    iget v0, p0, Lc/a/a/a/r/a;->g:I

    return v0
.end method

.method public b(I)V
    .registers 3

    .line 6
    iget-boolean v0, p0, Lc/a/a/a/r/a;->p:Z

    if-eqz v0, :cond_8

    iget v0, p0, Lc/a/a/a/r/a;->g:I

    if-eq v0, p1, :cond_17

    .line 7
    :cond_8
    iput p1, p0, Lc/a/a/a/r/a;->g:I

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lc/a/a/a/r/a;->p:Z

    .line 9
    iget-object v0, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m;->a(F)Lc/a/a/a/l0/m;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/r/a;->a(Lc/a/a/a/l0/m;)V

    :cond_17
    return-void
.end method

.method public b(II)V
    .registers 7

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->m:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    .line 2
    iget v1, p0, Lc/a/a/a/r/a;->c:I

    iget v2, p0, Lc/a/a/a/r/a;->e:I

    iget v3, p0, Lc/a/a/a/r/a;->d:I

    sub-int/2addr p2, v3

    iget v3, p0, Lc/a/a/a/r/a;->f:I

    sub-int/2addr p1, v3

    invoke-virtual {v0, v1, v2, p2, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_11
    return-void
.end method

.method public b(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/r/a;->k:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 4
    iput-object p1, p0, Lc/a/a/a/r/a;->k:Landroid/content/res/ColorStateList;

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/r/a;->r()V

    :cond_9
    return-void
.end method

.method public final b(Lc/a/a/a/l0/m;)V
    .registers 3

    .line 12
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 13
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 14
    :cond_d
    invoke-virtual {p0}, Lc/a/a/a/r/a;->m()Lc/a/a/a/l0/h;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 15
    invoke-virtual {p0}, Lc/a/a/a/r/a;->m()Lc/a/a/a/l0/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 16
    :cond_1a
    invoke-virtual {p0}, Lc/a/a/a/r/a;->e()Lc/a/a/a/l0/p;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 17
    invoke-virtual {p0}, Lc/a/a/a/r/a;->e()Lc/a/a/a/l0/p;

    move-result-object v0

    invoke-interface {v0, p1}, Lc/a/a/a/l0/p;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    :cond_27
    return-void
.end method

.method public b(Z)V
    .registers 2

    .line 11
    iput-boolean p1, p0, Lc/a/a/a/r/a;->q:Z

    return-void
.end method

.method public c()I
    .registers 2

    .line 8
    iget v0, p0, Lc/a/a/a/r/a;->f:I

    return v0
.end method

.method public c(I)V
    .registers 3

    .line 7
    iget v0, p0, Lc/a/a/a/r/a;->e:I

    invoke-virtual {p0, v0, p1}, Lc/a/a/a/r/a;->a(II)V

    return-void
.end method

.method public c(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->j:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_15

    .line 2
    iput-object p1, p0, Lc/a/a/a/r/a;->j:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object p1

    if-eqz p1, :cond_15

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object p1

    iget-object v0, p0, Lc/a/a/a/r/a;->j:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_15
    return-void
.end method

.method public c(Z)V
    .registers 2

    .line 5
    iput-boolean p1, p0, Lc/a/a/a/r/a;->n:Z

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/r/a;->r()V

    return-void
.end method

.method public d()I
    .registers 2

    .line 2
    iget v0, p0, Lc/a/a/a/r/a;->e:I

    return v0
.end method

.method public d(I)V
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/r/a;->f:I

    invoke-virtual {p0, p1, v0}, Lc/a/a/a/r/a;->a(II)V

    return-void
.end method

.method public e()Lc/a/a/a/l0/p;
    .registers 4

    .line 4
    iget-object v0, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_26

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_26

    .line 5
    iget-object v0, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    const/4 v2, 0x2

    if-le v0, v2, :cond_1d

    .line 6
    iget-object v0, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/l0/p;

    return-object v0

    .line 7
    :cond_1d
    iget-object v0, p0, Lc/a/a/a/r/a;->r:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/l0/p;

    return-object v0

    :cond_26
    const/4 v0, 0x0

    return-object v0
.end method

.method public e(I)V
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/r/a;->h:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lc/a/a/a/r/a;->h:I

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/r/a;->r()V

    :cond_9
    return-void
.end method

.method public f()Lc/a/a/a/l0/h;
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lc/a/a/a/r/a;->a(Z)Lc/a/a/a/l0/h;

    move-result-object v0

    return-object v0
.end method

.method public g()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->l:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public h()Lc/a/a/a/l0/m;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->b:Lc/a/a/a/l0/m;

    return-object v0
.end method

.method public i()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->k:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public j()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/r/a;->h:I

    return v0
.end method

.method public k()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->j:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public l()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    return-object v0
.end method

.method public final m()Lc/a/a/a/l0/h;
    .registers 2

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Lc/a/a/a/r/a;->a(Z)Lc/a/a/a/l0/h;

    move-result-object v0

    return-object v0
.end method

.method public n()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/r/a;->o:Z

    return v0
.end method

.method public o()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/r/a;->q:Z

    return v0
.end method

.method public p()V
    .registers 3

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lc/a/a/a/r/a;->o:Z

    .line 2
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    iget-object v1, p0, Lc/a/a/a/r/a;->j:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    iget-object v1, p0, Lc/a/a/a/r/a;->i:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public final q()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Lc/a/a/a/r/a;->a()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setInternalBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 3
    iget v1, p0, Lc/a/a/a/r/a;->s:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->b(F)V

    :cond_15
    return-void
.end method

.method public final r()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/r/a;->f()Lc/a/a/a/l0/h;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/r/a;->m()Lc/a/a/a/l0/h;

    move-result-object v1

    if-eqz v0, :cond_28

    .line 3
    iget v2, p0, Lc/a/a/a/r/a;->h:I

    int-to-float v2, v2

    iget-object v3, p0, Lc/a/a/a/r/a;->k:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v2, v3}, Lc/a/a/a/l0/h;->a(FLandroid/content/res/ColorStateList;)V

    if-eqz v1, :cond_28

    .line 4
    iget v0, p0, Lc/a/a/a/r/a;->h:I

    int-to-float v0, v0

    iget-boolean v2, p0, Lc/a/a/a/r/a;->n:Z

    if-eqz v2, :cond_24

    iget-object v2, p0, Lc/a/a/a/r/a;->a:Lcom/google/android/material/button/MaterialButton;

    sget v3, Lc/a/a/a/b;->colorSurface:I

    .line 5
    invoke-static {v2, v3}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result v2

    goto :goto_25

    :cond_24
    const/4 v2, 0x0

    .line 6
    :goto_25
    invoke-virtual {v1, v0, v2}, Lc/a/a/a/l0/h;->a(FI)V

    :cond_28
    return-void
.end method
