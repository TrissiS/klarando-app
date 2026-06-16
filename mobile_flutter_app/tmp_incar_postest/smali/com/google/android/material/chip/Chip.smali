.class public Lcom/google/android/material/chip/Chip;
.super Landroidx/appcompat/widget/AppCompatCheckBox;
.source "Chip.java"

# interfaces
.implements Lc/a/a/a/u/a$a;
.implements Lc/a/a/a/l0/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/chip/Chip$c;
    }
.end annotation


# static fields
.field public static final A:I

.field public static final B:Landroid/graphics/Rect;

.field public static final C:[I

.field public static final D:[I


# instance fields
.field public k:Lc/a/a/a/u/a;

.field public l:Landroid/graphics/drawable/InsetDrawable;

.field public m:Landroid/graphics/drawable/RippleDrawable;

.field public n:Landroid/view/View$OnClickListener;

.field public o:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:I

.field public v:I

.field public final w:Lcom/google/android/material/chip/Chip$c;

.field public final x:Landroid/graphics/Rect;

.field public final y:Landroid/graphics/RectF;

.field public final z:Lc/a/a/a/i0/f;


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_MaterialComponents_Chip_Action:I

    sput v0, Lcom/google/android/material/chip/Chip;->A:I

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/google/android/material/chip/Chip;->B:Landroid/graphics/Rect;

    const/4 v0, 0x1

    new-array v1, v0, [I

    const v2, 0x10100a1

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 3
    sput-object v1, Lcom/google/android/material/chip/Chip;->C:[I

    new-array v0, v0, [I

    const v1, 0x101009f

    aput v1, v0, v3

    .line 4
    sput-object v0, Lcom/google/android/material/chip/Chip;->D:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/chip/Chip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->chipStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/chip/Chip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11

    .line 3
    sget v0, Lcom/google/android/material/chip/Chip;->A:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->x:Landroid/graphics/Rect;

    .line 5
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->y:Landroid/graphics/RectF;

    .line 6
    new-instance p1, Lcom/google/android/material/chip/Chip$a;

    invoke-direct {p1, p0}, Lcom/google/android/material/chip/Chip$a;-><init>(Lcom/google/android/material/chip/Chip;)V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->z:Lc/a/a/a/i0/f;

    .line 7
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 8
    invoke-virtual {p0, p2}, Lcom/google/android/material/chip/Chip;->a(Landroid/util/AttributeSet;)V

    .line 9
    sget v0, Lcom/google/android/material/chip/Chip;->A:I

    .line 10
    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/u/a;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/u/a;

    move-result-object v6

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/chip/Chip;->a(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    invoke-virtual {p0, v6}, Lcom/google/android/material/chip/Chip;->setChipDrawable(Lc/a/a/a/u/a;)V

    .line 13
    invoke-static {p0}, Lb/h/m/y;->m(Landroid/view/View;)F

    move-result v0

    invoke-virtual {v6, v0}, Lc/a/a/a/l0/h;->b(F)V

    .line 14
    sget-object v2, Lc/a/a/a/l;->Chip:[I

    sget v4, Lcom/google/android/material/chip/Chip;->A:I

    const/4 v0, 0x0

    new-array v5, v0, [I

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    .line 15
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 16
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-ge p3, v0, :cond_55

    .line 17
    sget p3, Lc/a/a/a/l;->Chip_android_textColor:I

    .line 18
    invoke-static {p1, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 20
    :cond_55
    sget p1, Lc/a/a/a/l;->Chip_shapeAppearance:I

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    .line 21
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 22
    new-instance p2, Lcom/google/android/material/chip/Chip$c;

    invoke-direct {p2, p0, p0}, Lcom/google/android/material/chip/Chip$c;-><init>(Lcom/google/android/material/chip/Chip;Lcom/google/android/material/chip/Chip;)V

    iput-object p2, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->k()V

    if-nez p1, :cond_6d

    .line 24
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->e()V

    .line 25
    :cond_6d
    iget-boolean p1, p0, Lcom/google/android/material/chip/Chip;->p:Z

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setChecked(Z)V

    .line 26
    invoke-virtual {v6}, Lc/a/a/a/u/a;->k0()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 27
    invoke-virtual {v6}, Lc/a/a/a/u/a;->e0()Landroid/text/TextUtils$TruncateAt;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 28
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->o()V

    .line 29
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {p1}, Lc/a/a/a/u/a;->u0()Z

    move-result p1

    if-nez p1, :cond_92

    const/4 p1, 0x1

    .line 30
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setLines(I)V

    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setHorizontallyScrolling(Z)V

    :cond_92
    const p1, 0x800013

    .line 32
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setGravity(I)V

    .line 33
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->n()V

    .line 34
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->j()Z

    move-result p1

    if-eqz p1, :cond_a6

    .line 35
    iget p1, p0, Lcom/google/android/material/chip/Chip;->v:I

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setMinHeight(I)V

    .line 36
    :cond_a6
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/chip/Chip;->u:I

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/chip/Chip;)Lc/a/a/a/u/a;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/material/chip/Chip;Z)Z
    .registers 2

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->s:Z

    return p1
.end method

.method public static synthetic b(Lcom/google/android/material/chip/Chip;)Z
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->d()Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/google/android/material/chip/Chip;)Landroid/graphics/RectF;
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/material/chip/Chip;)Landroid/view/View$OnClickListener;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/chip/Chip;->n:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public static synthetic e(Lcom/google/android/material/chip/Chip;)Landroid/graphics/Rect;
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBoundsInt()Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method private getCloseIconTouchBounds()Landroid/graphics/RectF;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->y:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->d()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->n:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_16

    .line 3
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->y:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Lc/a/a/a/u/a;->a(Landroid/graphics/RectF;)V

    .line 4
    :cond_16
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->y:Landroid/graphics/RectF;

    return-object v0
.end method

.method private getCloseIconTouchBoundsInt()Landroid/graphics/Rect;
    .registers 6

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->x:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    float-to-int v2, v2

    iget v3, v0, Landroid/graphics/RectF;->top:F

    float-to-int v3, v3

    iget v4, v0, Landroid/graphics/RectF;->right:F

    float-to-int v4, v4

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    float-to-int v0, v0

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->x:Landroid/graphics/Rect;

    return-object v0
.end method

.method private getTextAppearance()Lc/a/a/a/i0/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->l0()Lc/a/a/a/i0/d;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public static synthetic p()Landroid/graphics/Rect;
    .registers 1

    .line 1
    sget-object v0, Lcom/google/android/material/chip/Chip;->B:Landroid/graphics/Rect;

    return-object v0
.end method

.method private setCloseIconHovered(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->r:Z

    if-eq v0, p1, :cond_9

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->r:Z

    .line 3
    invoke-virtual {p0}, Landroid/widget/CheckBox;->refreshDrawableState()V

    :cond_9
    return-void
.end method

.method private setCloseIconPressed(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->q:Z

    if-eq v0, p1, :cond_9

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->q:Z

    .line 3
    invoke-virtual {p0}, Landroid/widget/CheckBox;->refreshDrawableState()V

    :cond_9
    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 29
    iget v0, p0, Lcom/google/android/material/chip/Chip;->v:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/chip/Chip;->a(I)Z

    .line 30
    invoke-virtual {p0}, Landroid/widget/CheckBox;->requestLayout()V

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_11

    .line 32
    invoke-virtual {p0}, Landroid/widget/CheckBox;->invalidateOutline()V

    :cond_11
    return-void
.end method

.method public final a(IIII)V
    .registers 12

    .line 71
    new-instance v6, Landroid/graphics/drawable/InsetDrawable;

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    move-object v0, v6

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    iput-object v6, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    return-void
.end method

.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11

    .line 3
    sget-object v2, Lc/a/a/a/l;->Chip:[I

    sget v4, Lcom/google/android/material/chip/Chip;->A:I

    const/4 v6, 0x0

    new-array v5, v6, [I

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    .line 4
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 5
    sget p2, Lc/a/a/a/l;->Chip_ensureMinTouchTargetSize:I

    invoke-virtual {p1, p2, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/google/android/material/chip/Chip;->t:Z

    .line 6
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object p2

    const/16 p3, 0x30

    invoke-static {p2, p3}, Lc/a/a/a/d0/t;->a(Landroid/content/Context;I)F

    move-result p2

    float-to-double p2, p2

    invoke-static {p2, p3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p2

    double-to-float p2, p2

    .line 7
    sget p3, Lc/a/a/a/l;->Chip_chipMinTouchTargetSize:I

    .line 8
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    float-to-double p2, p2

    .line 9
    invoke-static {p2, p3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p2

    double-to-int p2, p2

    iput p2, p0, Lcom/google/android/material/chip/Chip;->v:I

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public final a(Landroid/util/AttributeSet;)V
    .registers 6

    if-nez p1, :cond_3

    return-void

    :cond_3
    const-string v0, "http://schemas.android.com/apk/res/android"

    const-string v1, "background"

    .line 11
    invoke-interface {p1, v0, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Chip"

    if-eqz v1, :cond_14

    const-string v1, "Do not set the background; Chip manages its own background drawable."

    .line 12
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_14
    const-string v1, "drawableLeft"

    .line 13
    invoke-interface {p1, v0, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_84

    const-string v1, "drawableStart"

    .line 14
    invoke-interface {p1, v0, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_7c

    const-string v1, "drawableEnd"

    .line 15
    invoke-interface {p1, v0, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Please set end drawable using R.attr#closeIcon."

    if-nez v1, :cond_76

    const-string v1, "drawableRight"

    .line 16
    invoke-interface {p1, v0, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_70

    const/4 v1, 0x1

    const-string v3, "singleLine"

    .line 17
    invoke-interface {p1, v0, v3, v1}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_68

    const-string v3, "lines"

    .line 18
    invoke-interface {p1, v0, v3, v1}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_68

    const-string v3, "minLines"

    .line 19
    invoke-interface {p1, v0, v3, v1}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_68

    const-string v3, "maxLines"

    .line 20
    invoke-interface {p1, v0, v3, v1}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_68

    const v1, 0x800013

    const-string v3, "gravity"

    .line 21
    invoke-interface {p1, v0, v3, v1}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p1

    if-eq p1, v1, :cond_67

    const-string p1, "Chip text must be vertically center and start aligned"

    .line 22
    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_67
    return-void

    .line 23
    :cond_68
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 24
    :cond_70
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 25
    :cond_76
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 26
    :cond_7c
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 27
    :cond_84
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Please set left drawable using R.attr#chipIcon."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Lc/a/a/a/u/a;)V
    .registers 2

    .line 28
    invoke-virtual {p1, p0}, Lc/a/a/a/u/a;->a(Lc/a/a/a/u/a$a;)V

    return-void
.end method

.method public a(I)Z
    .registers 7

    .line 45
    iput p1, p0, Lcom/google/android/material/chip/Chip;->v:I

    .line 46
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->j()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_15

    .line 47
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    if-eqz p1, :cond_11

    .line 48
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->i()V

    goto :goto_14

    .line 49
    :cond_11
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->l()V

    :goto_14
    return v1

    .line 50
    :cond_15
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {v0}, Lc/a/a/a/u/a;->getIntrinsicHeight()I

    move-result v0

    sub-int v0, p1, v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 51
    iget-object v2, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {v2}, Lc/a/a/a/u/a;->getIntrinsicWidth()I

    move-result v2

    sub-int v2, p1, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-gtz v2, :cond_3d

    if-gtz v0, :cond_3d

    .line 52
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    if-eqz p1, :cond_39

    .line 53
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->i()V

    goto :goto_3c

    .line 54
    :cond_39
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->l()V

    :goto_3c
    return v1

    :cond_3d
    if-lez v2, :cond_42

    .line 55
    div-int/lit8 v2, v2, 0x2

    goto :goto_43

    :cond_42
    const/4 v2, 0x0

    :goto_43
    if-lez v0, :cond_47

    .line 56
    div-int/lit8 v1, v0, 0x2

    .line 57
    :cond_47
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    const/4 v3, 0x1

    if-eqz v0, :cond_6a

    .line 58
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 59
    iget-object v4, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v4, v0}, Landroid/graphics/drawable/InsetDrawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 60
    iget v4, v0, Landroid/graphics/Rect;->top:I

    if-ne v4, v1, :cond_6a

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    if-ne v4, v1, :cond_6a

    iget v4, v0, Landroid/graphics/Rect;->left:I

    if-ne v4, v2, :cond_6a

    iget v0, v0, Landroid/graphics/Rect;->right:I

    if-ne v0, v2, :cond_6a

    .line 61
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->l()V

    return v3

    .line 62
    :cond_6a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-lt v0, v4, :cond_83

    .line 63
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getMinHeight()I

    move-result v0

    if-eq v0, p1, :cond_79

    .line 64
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setMinHeight(I)V

    .line 65
    :cond_79
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getMinWidth()I

    move-result v0

    if-eq v0, p1, :cond_89

    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setMinWidth(I)V

    goto :goto_89

    .line 67
    :cond_83
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setMinHeight(I)V

    .line 68
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setMinWidth(I)V

    .line 69
    :cond_89
    :goto_89
    invoke-virtual {p0, v2, v1, v2, v1}, Lcom/google/android/material/chip/Chip;->a(IIII)V

    .line 70
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->l()V

    return v3
.end method

.method public final a(Landroid/view/MotionEvent;)Z
    .registers 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 33
    const-class v0, Lb/j/a/a;

    const-string v1, "Unable to send Accessibility Exit event"

    const-string v2, "Chip"

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v3, 0x0

    const/16 v4, 0xa

    if-ne p1, v4, :cond_5d

    :try_start_f
    const-string p1, "m"

    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v4, 0x1

    .line 35
    invoke-virtual {p1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 36
    iget-object v5, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    invoke-virtual {p1, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/high16 v5, -0x80000000

    if-eq p1, v5, :cond_5d

    const-string p1, "i"

    new-array v6, v4, [Ljava/lang/Class;

    .line 37
    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    .line 38
    invoke-virtual {v0, p1, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 39
    invoke-virtual {p1, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 40
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v3

    invoke-virtual {p1, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_45
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f .. :try_end_45} :catch_4c
    .catch Ljava/lang/IllegalAccessException; {:try_start_f .. :try_end_45} :catch_4a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_f .. :try_end_45} :catch_48
    .catch Ljava/lang/NoSuchFieldException; {:try_start_f .. :try_end_45} :catch_46

    return v4

    :catch_46
    move-exception p1

    goto :goto_4e

    :catch_48
    move-exception p1

    goto :goto_52

    :catch_4a
    move-exception p1

    goto :goto_56

    :catch_4c
    move-exception p1

    goto :goto_5a

    .line 41
    :goto_4e
    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5d

    .line 42
    :goto_52
    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5d

    .line 43
    :goto_56
    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5d

    .line 44
    :goto_5a
    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5d
    :goto_5d
    return v3
.end method

.method public final b(Lc/a/a/a/u/a;)V
    .registers 3

    if-eqz p1, :cond_6

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lc/a/a/a/u/a;->a(Lc/a/a/a/u/a$a;)V

    :cond_6
    return-void
.end method

.method public final b()[I
    .registers 5

    .line 3
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    .line 4
    :goto_b
    iget-boolean v3, p0, Lcom/google/android/material/chip/Chip;->s:Z

    if-eqz v3, :cond_11

    add-int/lit8 v0, v0, 0x1

    .line 5
    :cond_11
    iget-boolean v3, p0, Lcom/google/android/material/chip/Chip;->r:Z

    if-eqz v3, :cond_17

    add-int/lit8 v0, v0, 0x1

    .line 6
    :cond_17
    iget-boolean v3, p0, Lcom/google/android/material/chip/Chip;->q:Z

    if-eqz v3, :cond_1d

    add-int/lit8 v0, v0, 0x1

    .line 7
    :cond_1d
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_25

    add-int/lit8 v0, v0, 0x1

    .line 8
    :cond_25
    new-array v0, v0, [I

    .line 9
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_33

    const v3, 0x101009e

    .line 10
    aput v3, v0, v1

    const/4 v1, 0x1

    .line 11
    :cond_33
    iget-boolean v2, p0, Lcom/google/android/material/chip/Chip;->s:Z

    if-eqz v2, :cond_3e

    const v2, 0x101009c

    .line 12
    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 13
    :cond_3e
    iget-boolean v2, p0, Lcom/google/android/material/chip/Chip;->r:Z

    if-eqz v2, :cond_49

    const v2, 0x1010367

    .line 14
    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 15
    :cond_49
    iget-boolean v2, p0, Lcom/google/android/material/chip/Chip;->q:Z

    if-eqz v2, :cond_54

    const v2, 0x10100a7

    .line 16
    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 17
    :cond_54
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_5f

    const v2, 0x10100a1

    .line 18
    aput v2, v0, v1

    :cond_5f
    return-object v0
.end method

.method public final c()V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    if-ne v0, v1, :cond_17

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    if-nez v0, :cond_17

    .line 3
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_17
    return-void
.end method

.method public final d()Z
    .registers 2

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lc/a/a/a/u/a;->V()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->a(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_17

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    .line 2
    invoke-virtual {v0, p1}, Lb/j/a/a;->a(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 3
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_15

    goto :goto_17

    :cond_15
    const/4 p1, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 p1, 0x1

    :goto_18
    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    invoke-virtual {v0, p1}, Lb/j/a/a;->a(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    .line 3
    invoke-virtual {v0}, Lb/j/a/a;->f()I

    move-result v0

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_14

    const/4 p1, 0x1

    return p1

    .line 4
    :cond_14
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public drawableStateChanged()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroidx/appcompat/widget/AppCompatCheckBox;->drawableStateChanged()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lc/a/a/a/u/a;->r0()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 3
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->b()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/u/a;->b([I)Z

    move-result v0

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    if-eqz v0, :cond_1e

    .line 4
    invoke-virtual {p0}, Landroid/widget/CheckBox;->invalidate()V

    :cond_1e
    return-void
.end method

.method public final e()V
    .registers 3

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 3
    new-instance v0, Lcom/google/android/material/chip/Chip$b;

    invoke-direct {v0, p0}, Lcom/google/android/material/chip/Chip$b;-><init>(Lcom/google/android/material/chip/Chip;)V

    invoke-virtual {p0, v0}, Landroid/widget/CheckBox;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    :cond_e
    return-void
.end method

.method public f()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lc/a/a/a/u/a;->q0()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public g()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lc/a/a/a/u/a;->s0()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public getBackgroundDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    if-nez v0, :cond_6

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    :cond_6
    return-object v0
.end method

.method public getCheckedIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->J()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getCheckedIconTint()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->K()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getChipBackgroundColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->L()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getChipCornerRadius()F
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Lc/a/a/a/u/a;->M()F

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v1

    :cond_d
    return v1
.end method

.method public getChipDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    return-object v0
.end method

.method public getChipEndPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->N()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getChipIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->O()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getChipIconSize()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->P()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getChipIconTint()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->Q()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getChipMinHeight()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->R()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getChipStartPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->S()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getChipStrokeColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->T()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getChipStrokeWidth()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->U()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getChipText()Ljava/lang/CharSequence;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getCloseIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->V()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getCloseIconContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->W()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getCloseIconEndPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->X()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getCloseIconSize()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->Y()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getCloseIconStartPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->Z()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getCloseIconTint()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->b0()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getEllipsize()Landroid/text/TextUtils$TruncateAt;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->e0()Landroid/text/TextUtils$TruncateAt;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getFocusedRect(Landroid/graphics/Rect;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    invoke-virtual {v0}, Lb/j/a/a;->f()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_16

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    .line 2
    invoke-virtual {v0}, Lb/j/a/a;->d()I

    move-result v0

    if-ne v0, v1, :cond_12

    goto :goto_16

    .line 3
    :cond_12
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->getFocusedRect(Landroid/graphics/Rect;)V

    goto :goto_1d

    .line 4
    :cond_16
    :goto_16
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBoundsInt()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    :goto_1d
    return-void
.end method

.method public getHideMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->f0()Lc/a/a/a/m/h;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getIconEndPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->g0()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getIconStartPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->h0()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getRippleColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->i0()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getShapeAppearanceModel()Lc/a/a/a/l0/m;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object v0

    return-object v0
.end method

.method public getShowMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->j0()Lc/a/a/a/m/h;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getTextEndPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->m0()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getTextStartPadding()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a/a/a/u/a;->n0()F

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public h()Z
    .registers 4

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Landroid/widget/CheckBox;->playSoundEffect(I)V

    .line 2
    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->n:Landroid/view/View$OnClickListener;

    const/4 v2, 0x1

    if-eqz v1, :cond_d

    .line 3
    invoke-interface {v1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    const/4 v0, 0x1

    .line 4
    :cond_d
    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    invoke-virtual {v1, v2, v2}, Lb/j/a/a;->d(II)Z

    return v0
.end method

.method public final i()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    if-eqz v0, :cond_16

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/CheckBox;->setMinWidth(I)V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getChipMinHeight()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p0, v0}, Landroid/widget/CheckBox;->setMinHeight(I)V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->l()V

    :cond_16
    return-void
.end method

.method public j()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->t:Z

    return v0
.end method

.method public final k()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->d()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->g()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->n:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_16

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    goto :goto_1a

    :cond_16
    const/4 v0, 0x0

    .line 3
    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    :goto_1a
    return-void
.end method

.method public final l()V
    .registers 3

    .line 1
    sget-boolean v0, Lc/a/a/a/j0/b;->a:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->m()V

    goto :goto_1b

    .line 3
    :cond_8
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lc/a/a/a/u/a;->g(Z)V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->n()V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->c()V

    :goto_1b
    return-void
.end method

.method public final m()V
    .registers 5

    .line 1
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    .line 2
    invoke-virtual {v1}, Lc/a/a/a/u/a;->i0()Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-static {v1}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/google/android/material/chip/Chip;->m:Landroid/graphics/drawable/RippleDrawable;

    .line 4
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lc/a/a/a/u/a;->g(Z)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->m:Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->n()V

    return-void
.end method

.method public final n()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_56

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-nez v0, :cond_f

    goto :goto_56

    .line 2
    :cond_f
    invoke-virtual {v0}, Lc/a/a/a/u/a;->N()F

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    .line 3
    invoke-virtual {v1}, Lc/a/a/a/u/a;->m0()F

    move-result v1

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    .line 4
    invoke-virtual {v1}, Lc/a/a/a/u/a;->G()F

    move-result v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    .line 5
    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    .line 6
    invoke-virtual {v1}, Lc/a/a/a/u/a;->S()F

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    .line 7
    invoke-virtual {v2}, Lc/a/a/a/u/a;->n0()F

    move-result v2

    add-float/2addr v1, v2

    iget-object v2, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    .line 8
    invoke-virtual {v2}, Lc/a/a/a/u/a;->F()F

    move-result v2

    add-float/2addr v1, v2

    float-to-int v1, v1

    .line 9
    iget-object v2, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    if-eqz v2, :cond_4b

    .line 10
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 11
    iget-object v3, p0, Lcom/google/android/material/chip/Chip;->l:Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/InsetDrawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 12
    iget v3, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v3

    .line 13
    iget v2, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v2

    .line 14
    :cond_4b
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/CheckBox;->getPaddingBottom()I

    move-result v3

    .line 15
    invoke-static {p0, v1, v2, v0, v3}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    :cond_56
    :goto_56
    return-void
.end method

.method public final o()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v1, :cond_e

    .line 3
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    iput-object v1, v0, Landroid/text/TextPaint;->drawableState:[I

    .line 4
    :cond_e
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getTextAppearance()Lc/a/a/a/i0/d;

    move-result-object v1

    if-eqz v1, :cond_1d

    .line 5
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/material/chip/Chip;->z:Lc/a/a/a/i0/f;

    invoke-virtual {v1, v2, v0, v3}, Lc/a/a/a/i0/d;->b(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V

    :cond_1d
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/CheckBox;->onAttachedToWindow()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-static {p0, v0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;Lc/a/a/a/l0/h;)V

    return-void
.end method

.method public onCreateDrawableState(I)[I
    .registers 3

    add-int/lit8 p1, p1, 0x2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->onCreateDrawableState(I)[I

    move-result-object p1

    .line 2
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 3
    sget-object v0, Lcom/google/android/material/chip/Chip;->C:[I

    invoke-static {p1, v0}, Landroid/widget/CheckBox;->mergeDrawableStates([I[I)[I

    .line 4
    :cond_11
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->f()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 5
    sget-object v0, Lcom/google/android/material/chip/Chip;->D:[I

    invoke-static {p1, v0}, Landroid/widget/CheckBox;->mergeDrawableStates([I[I)[I

    :cond_1c
    return-object p1
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/CheckBox;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->w:Lcom/google/android/material/chip/Chip$c;

    invoke-virtual {v0, p1, p2, p3}, Lb/j/a/a;->a(ZILandroid/graphics/Rect;)V

    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x7

    if-eq v0, v1, :cond_11

    const/16 v1, 0xa

    if-eq v0, v1, :cond_c

    goto :goto_24

    :cond_c
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/android/material/chip/Chip;->setCloseIconHovered(Z)V

    goto :goto_24

    .line 3
    :cond_11
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/google/android/material/chip/Chip;->setCloseIconHovered(Z)V

    .line 4
    :goto_24
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 10

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->f()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {p0}, Landroid/widget/CheckBox;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_16

    :cond_10
    const-string v0, "android.view.View"

    .line 3
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    goto :goto_24

    .line 4
    :cond_16
    :goto_16
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->f()Z

    move-result v0

    if-eqz v0, :cond_1f

    const-string v0, "android.widget.CompoundButton"

    goto :goto_21

    :cond_1f
    const-string v0, "android.widget.Button"

    .line 5
    :goto_21
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 6
    :goto_24
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->f()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCheckable(Z)V

    .line 7
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isClickable()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClickable(Z)V

    .line 8
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Lcom/google/android/material/chip/ChipGroup;

    if-eqz v0, :cond_64

    .line 9
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/chip/ChipGroup;

    .line 10
    invoke-static {p1}, Lb/h/m/h0/c;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)Lb/h/m/h0/c;

    move-result-object p1

    .line 11
    invoke-virtual {v0}, Lcom/google/android/material/chip/ChipGroup;->a()Z

    move-result v1

    if-eqz v1, :cond_50

    invoke-virtual {v0, p0}, Lcom/google/android/material/chip/ChipGroup;->b(Landroid/view/View;)I

    move-result v1

    move v4, v1

    goto :goto_52

    :cond_50
    const/4 v1, -0x1

    const/4 v4, -0x1

    .line 12
    :goto_52
    invoke-virtual {v0, p0}, Lcom/google/android/material/internal/FlowLayout;->a(Landroid/view/View;)I

    move-result v2

    const/4 v3, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 13
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v7

    .line 14
    invoke-static/range {v2 .. v7}, Lb/h/m/h0/c$c;->a(IIIIZZ)Lb/h/m/h0/c$c;

    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->b(Ljava/lang/Object;)V

    :cond_64
    return-void
.end method

.method public onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {p2, v0, p1}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_23

    invoke-virtual {p0}, Landroid/widget/CheckBox;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_23

    .line 2
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 p2, 0x3ea

    invoke-static {p1, p2}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object p1

    return-object p1

    :cond_23
    const/4 p1, 0x0

    return-object p1
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->onRtlPropertiesChanged(I)V

    .line 2
    iget v0, p0, Lcom/google/android/material/chip/Chip;->u:I

    if-eq v0, p1, :cond_c

    .line 3
    iput p1, p0, Lcom/google/android/material/chip/Chip;->u:I

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->n()V

    :cond_c
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_39

    if-eq v0, v3, :cond_2b

    const/4 v4, 0x2

    if-eq v0, v4, :cond_21

    const/4 v1, 0x3

    if-eq v0, v1, :cond_34

    goto :goto_40

    .line 3
    :cond_21
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->q:Z

    if-eqz v0, :cond_40

    if-nez v1, :cond_3e

    .line 4
    invoke-direct {p0, v2}, Lcom/google/android/material/chip/Chip;->setCloseIconPressed(Z)V

    goto :goto_3e

    .line 5
    :cond_2b
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->q:Z

    if-eqz v0, :cond_34

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->h()Z

    const/4 v0, 0x1

    goto :goto_35

    :cond_34
    const/4 v0, 0x0

    .line 7
    :goto_35
    invoke-direct {p0, v2}, Lcom/google/android/material/chip/Chip;->setCloseIconPressed(Z)V

    goto :goto_41

    :cond_39
    if-eqz v1, :cond_40

    .line 8
    invoke-direct {p0, v3}, Lcom/google/android/material/chip/Chip;->setCloseIconPressed(Z)V

    :cond_3e
    :goto_3e
    const/4 v0, 0x1

    goto :goto_41

    :cond_40
    :goto_40
    const/4 v0, 0x0

    :goto_41
    if-nez v0, :cond_49

    .line 9
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_4a

    :cond_49
    const/4 v2, 0x1

    :cond_4a
    return v2
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p1, v0, :cond_12

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->m:Landroid/graphics/drawable/RippleDrawable;

    if-eq p1, v0, :cond_12

    const-string p1, "Chip"

    const-string v0, "Do not set the background; Chip manages its own background drawable."

    .line 2
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 3
    :cond_12
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_15
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3

    const-string p1, "Chip"

    const-string v0, "Do not set the background color; Chip manages its own background drawable."

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p1, v0, :cond_12

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->m:Landroid/graphics/drawable/RippleDrawable;

    if-eq p1, v0, :cond_12

    const-string p1, "Chip"

    const-string v0, "Do not set the background drawable; Chip manages its own background drawable."

    .line 2
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 3
    :cond_12
    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatCheckBox;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_15
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3

    const-string p1, "Chip"

    const-string v0, "Do not set the background resource; Chip manages its own background drawable."

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    const-string p1, "Chip"

    const-string v0, "Do not set the background tint list; Chip manages its own background drawable."

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    const-string p1, "Chip"

    const-string v0, "Do not set the background tint mode; Chip manages its own background drawable."

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setCheckable(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->b(Z)V

    :cond_7
    return-void
.end method

.method public setCheckableResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->e(I)V

    :cond_7
    return-void
.end method

.method public setChecked(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-nez v0, :cond_7

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->p:Z

    goto :goto_1d

    .line 3
    :cond_7
    invoke-virtual {v0}, Lc/a/a/a/u/a;->q0()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 4
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    .line 5
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    if-eq v0, p1, :cond_1d

    .line 6
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->o:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    if-eqz v0, :cond_1d

    .line 7
    invoke-interface {v0, p0, p1}, Landroid/widget/CompoundButton$OnCheckedChangeListener;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method public setCheckedIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->b(Landroid/graphics/drawable/Drawable;)V

    :cond_7
    return-void
.end method

.method public setCheckedIconEnabled(Z)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCheckedIconVisible(Z)V

    return-void
.end method

.method public setCheckedIconEnabledResource(I)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCheckedIconVisible(I)V

    return-void
.end method

.method public setCheckedIconResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->f(I)V

    :cond_7
    return-void
.end method

.method public setCheckedIconTint(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->c(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setCheckedIconTintResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->g(I)V

    :cond_7
    return-void
.end method

.method public setCheckedIconVisible(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->h(I)V

    :cond_7
    return-void
.end method

.method public setCheckedIconVisible(Z)V
    .registers 3

    .line 3
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 4
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->c(Z)V

    :cond_7
    return-void
.end method

.method public setChipBackgroundColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->d(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setChipBackgroundColorResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->i(I)V

    :cond_7
    return-void
.end method

.method public setChipCornerRadius(F)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->f(F)V

    :cond_7
    return-void
.end method

.method public setChipCornerRadiusResource(I)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->j(I)V

    :cond_7
    return-void
.end method

.method public setChipDrawable(Lc/a/a/a/u/a;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eq v0, p1, :cond_17

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/material/chip/Chip;->b(Lc/a/a/a/u/a;)V

    .line 3
    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Lc/a/a/a/u/a;->f(Z)V

    .line 5
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->a(Lc/a/a/a/u/a;)V

    .line 6
    iget p1, p0, Lcom/google/android/material/chip/Chip;->v:I

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->a(I)Z

    :cond_17
    return-void
.end method

.method public setChipEndPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->g(F)V

    :cond_7
    return-void
.end method

.method public setChipEndPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->k(I)V

    :cond_7
    return-void
.end method

.method public setChipIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->c(Landroid/graphics/drawable/Drawable;)V

    :cond_7
    return-void
.end method

.method public setChipIconEnabled(Z)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setChipIconVisible(Z)V

    return-void
.end method

.method public setChipIconEnabledResource(I)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setChipIconVisible(I)V

    return-void
.end method

.method public setChipIconResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->l(I)V

    :cond_7
    return-void
.end method

.method public setChipIconSize(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->h(F)V

    :cond_7
    return-void
.end method

.method public setChipIconSizeResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->m(I)V

    :cond_7
    return-void
.end method

.method public setChipIconTint(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->e(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setChipIconTintResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->n(I)V

    :cond_7
    return-void
.end method

.method public setChipIconVisible(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->o(I)V

    :cond_7
    return-void
.end method

.method public setChipIconVisible(Z)V
    .registers 3

    .line 3
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 4
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->d(Z)V

    :cond_7
    return-void
.end method

.method public setChipMinHeight(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->i(F)V

    :cond_7
    return-void
.end method

.method public setChipMinHeightResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->p(I)V

    :cond_7
    return-void
.end method

.method public setChipStartPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->j(F)V

    :cond_7
    return-void
.end method

.method public setChipStartPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->q(I)V

    :cond_7
    return-void
.end method

.method public setChipStrokeColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->f(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setChipStrokeColorResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->r(I)V

    :cond_7
    return-void
.end method

.method public setChipStrokeWidth(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->k(F)V

    :cond_7
    return-void
.end method

.method public setChipStrokeWidthResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->s(I)V

    :cond_7
    return-void
.end method

.method public setChipText(Ljava/lang/CharSequence;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setChipTextResource(I)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setCloseIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->d(Landroid/graphics/drawable/Drawable;)V

    .line 3
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->k()V

    return-void
.end method

.method public setCloseIconContentDescription(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->a(Ljava/lang/CharSequence;)V

    :cond_7
    return-void
.end method

.method public setCloseIconEnabled(Z)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCloseIconVisible(Z)V

    return-void
.end method

.method public setCloseIconEnabledResource(I)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCloseIconVisible(I)V

    return-void
.end method

.method public setCloseIconEndPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->l(F)V

    :cond_7
    return-void
.end method

.method public setCloseIconEndPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->t(I)V

    :cond_7
    return-void
.end method

.method public setCloseIconResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->u(I)V

    .line 3
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->k()V

    return-void
.end method

.method public setCloseIconSize(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->m(F)V

    :cond_7
    return-void
.end method

.method public setCloseIconSizeResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->v(I)V

    :cond_7
    return-void
.end method

.method public setCloseIconStartPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->n(F)V

    :cond_7
    return-void
.end method

.method public setCloseIconStartPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->w(I)V

    :cond_7
    return-void
.end method

.method public setCloseIconTint(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->h(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setCloseIconTintResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->x(I)V

    :cond_7
    return-void
.end method

.method public setCloseIconVisible(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCloseIconVisible(Z)V

    return-void
.end method

.method public setCloseIconVisible(Z)V
    .registers 3

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->e(Z)V

    .line 4
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->k()V

    return-void
.end method

.method public setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    if-nez p1, :cond_10

    if-nez p3, :cond_8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CheckBox;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 2
    :cond_8
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3
    :cond_10
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    if-nez p1, :cond_10

    if-nez p3, :cond_8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CheckBox;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 2
    :cond_8
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3
    :cond_10
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V
    .registers 5

    if-nez p1, :cond_10

    if-nez p3, :cond_8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CheckBox;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    return-void

    .line 2
    :cond_8
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3
    :cond_10
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    if-nez p1, :cond_10

    if-nez p3, :cond_8

    .line 4
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CheckBox;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 5
    :cond_8
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 6
    :cond_10
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCompoundDrawablesWithIntrinsicBounds(IIII)V
    .registers 5

    if-nez p1, :cond_10

    if-nez p3, :cond_8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CheckBox;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    return-void

    .line 2
    :cond_8
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3
    :cond_10
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    if-nez p1, :cond_10

    if-nez p3, :cond_8

    .line 4
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CheckBox;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 5
    :cond_8
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set right drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 6
    :cond_10
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set left drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setElevation(F)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setElevation(F)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->b(F)V

    :cond_a
    return-void
.end method

.method public setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    if-eq p1, v0, :cond_14

    .line 3
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_13

    .line 5
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->a(Landroid/text/TextUtils$TruncateAt;)V

    :cond_13
    return-void

    .line 6
    :cond_14
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Text within a chip are not allowed to scroll."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEnsureMinTouchTargetSize(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->t:Z

    .line 2
    iget p1, p0, Lcom/google/android/material/chip/Chip;->v:I

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->a(I)Z

    return-void
.end method

.method public setGravity(I)V
    .registers 3

    const v0, 0x800013

    if-eq p1, v0, :cond_d

    const-string p1, "Chip"

    const-string v0, "Chip text must be vertically center and start aligned"

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10

    .line 2
    :cond_d
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setGravity(I)V

    :goto_10
    return-void
.end method

.method public setHideMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->a(Lc/a/a/a/m/h;)V

    :cond_7
    return-void
.end method

.method public setHideMotionSpecResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->y(I)V

    :cond_7
    return-void
.end method

.method public setIconEndPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->o(F)V

    :cond_7
    return-void
.end method

.method public setIconEndPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->z(I)V

    :cond_7
    return-void
.end method

.method public setIconStartPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->p(F)V

    :cond_7
    return-void
.end method

.method public setIconStartPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->A(I)V

    :cond_7
    return-void
.end method

.method public setLayoutDirection(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_e

    .line 3
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setLayoutDirection(I)V

    :cond_e
    return-void
.end method

.method public setLines(I)V
    .registers 3

    const/4 v0, 0x1

    if-gt p1, v0, :cond_7

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setLines(I)V

    return-void

    .line 2
    :cond_7
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setMaxLines(I)V
    .registers 3

    const/4 v0, 0x1

    if-gt p1, v0, :cond_7

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setMaxLines(I)V

    return-void

    .line 2
    :cond_7
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setMaxWidth(I)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setMaxWidth(I)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->B(I)V

    :cond_a
    return-void
.end method

.method public setMinLines(I)V
    .registers 3

    const/4 v0, 0x1

    if-gt p1, v0, :cond_7

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setMinLines(I)V

    return-void

    .line 2
    :cond_7
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOnCheckedChangeListenerInternal(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->o:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-void
.end method

.method public setOnCloseIconClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->n:Landroid/view/View$OnClickListener;

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->k()V

    return-void
.end method

.method public setRippleColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->i(Landroid/content/res/ColorStateList;)V

    .line 3
    :cond_7
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {p1}, Lc/a/a/a/u/a;->p0()Z

    move-result p1

    if-nez p1, :cond_12

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->m()V

    :cond_12
    return-void
.end method

.method public setRippleColorResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_12

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->C(I)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {p1}, Lc/a/a/a/u/a;->p0()Z

    move-result p1

    if-nez p1, :cond_12

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->m()V

    :cond_12
    return-void
.end method

.method public setShapeAppearanceModel(Lc/a/a/a/l0/m;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public setShowMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->b(Lc/a/a/a/m/h;)V

    :cond_7
    return-void
.end method

.method public setShowMotionSpecResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->D(I)V

    :cond_7
    return-void
.end method

.method public setSingleLine(Z)V
    .registers 3

    if-eqz p1, :cond_6

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setSingleLine(Z)V

    return-void

    .line 2
    :cond_6
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-nez v0, :cond_5

    return-void

    :cond_5
    if-nez p1, :cond_9

    const-string p1, ""

    .line 2
    :cond_9
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    invoke-virtual {v0}, Lc/a/a/a/u/a;->u0()Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    goto :goto_14

    :cond_13
    move-object v0, p1

    :goto_14
    invoke-super {p0, v0, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 3
    iget-object p2, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz p2, :cond_1e

    .line 4
    invoke-virtual {p2, p1}, Lc/a/a/a/u/a;->b(Ljava/lang/CharSequence;)V

    :cond_1e
    return-void
.end method

.method public setTextAppearance(I)V
    .registers 3

    .line 8
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setTextAppearance(I)V

    .line 9
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_a

    .line 10
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->E(I)V

    .line 11
    :cond_a
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->o()V

    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3

    .line 4
    invoke-super {p0, p1, p2}, Landroid/widget/CheckBox;->setTextAppearance(Landroid/content/Context;I)V

    .line 5
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz p1, :cond_a

    .line 6
    invoke-virtual {p1, p2}, Lc/a/a/a/u/a;->E(I)V

    .line 7
    :cond_a
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->o()V

    return-void
.end method

.method public setTextAppearance(Lc/a/a/a/i0/d;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->a(Lc/a/a/a/i0/d;)V

    .line 3
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->o()V

    return-void
.end method

.method public setTextAppearanceResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/chip/Chip;->setTextAppearance(Landroid/content/Context;I)V

    return-void
.end method

.method public setTextEndPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->q(F)V

    :cond_7
    return-void
.end method

.method public setTextEndPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->F(I)V

    :cond_7
    return-void
.end method

.method public setTextStartPadding(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->r(F)V

    :cond_7
    return-void
.end method

.method public setTextStartPaddingResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->k:Lc/a/a/a/u/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/u/a;->G(I)V

    :cond_7
    return-void
.end method
