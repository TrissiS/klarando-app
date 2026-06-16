.class public Lcom/google/android/material/timepicker/ClockFaceView;
.super Lcom/google/android/material/timepicker/RadialViewGroup;
.source "ClockFaceView.java"

# interfaces
.implements Lcom/google/android/material/timepicker/ClockHandView$d;


# instance fields
.field public final B:Lcom/google/android/material/timepicker/ClockHandView;

.field public final C:Landroid/graphics/Rect;

.field public final D:Landroid/graphics/RectF;

.field public final E:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field public final F:Lb/h/m/a;

.field public final G:[I

.field public final H:[F

.field public final I:I

.field public final J:I

.field public final K:I

.field public final L:I

.field public M:[Ljava/lang/String;

.field public N:F

.field public final O:Landroid/content/res/ColorStateList;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/timepicker/ClockFaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->materialClockStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/timepicker/ClockFaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/timepicker/RadialViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->C:Landroid/graphics/Rect;

    .line 5
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->D:Landroid/graphics/RectF;

    .line 6
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    const/4 v0, 0x3

    new-array v1, v0, [F

    .line 7
    fill-array-data v1, :array_d0

    iput-object v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->H:[F

    .line 8
    sget-object v1, Lc/a/a/a/l;->ClockFaceView:[I

    sget v2, Lc/a/a/a/k;->Widget_MaterialComponents_TimePicker_Clock:I

    .line 9
    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    .line 11
    sget v1, Lc/a/a/a/l;->ClockFaceView_clockNumberTextColor:I

    .line 12
    invoke-static {p1, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->O:Landroid/content/res/ColorStateList;

    .line 13
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lc/a/a/a/h;->material_clockface_view:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    sget v1, Lc/a/a/a/f;->material_clock_hand:I

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/timepicker/ClockHandView;

    iput-object v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->B:Lcom/google/android/material/timepicker/ClockHandView;

    .line 15
    sget v1, Lc/a/a/a/d;->material_clock_hand_padding:I

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->I:I

    .line 16
    iget-object v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->O:Landroid/content/res/ColorStateList;

    new-array v2, v3, [I

    const v4, 0x10100a1

    const/4 v5, 0x0

    aput v4, v2, v5

    .line 17
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    .line 18
    invoke-virtual {v1, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    new-array v0, v0, [I

    aput v1, v0, v5

    aput v1, v0, v3

    .line 19
    iget-object v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->O:Landroid/content/res/ColorStateList;

    .line 20
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    const/4 v2, 0x2

    aput v1, v0, v2

    iput-object v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->G:[I

    .line 21
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->B:Lcom/google/android/material/timepicker/ClockHandView;

    invoke-virtual {v0, p0}, Lcom/google/android/material/timepicker/ClockHandView;->a(Lcom/google/android/material/timepicker/ClockHandView$d;)V

    .line 22
    sget v0, Lc/a/a/a/c;->material_timepicker_clockface:I

    .line 23
    invoke-static {p1, v0}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    .line 25
    sget v1, Lc/a/a/a/l;->ClockFaceView_clockFaceBackgroundColor:I

    .line 26
    invoke-static {p1, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    if-nez p1, :cond_8b

    goto :goto_8f

    .line 27
    :cond_8b
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    .line 28
    :goto_8f
    invoke-virtual {p0, v0}, Lcom/google/android/material/timepicker/RadialViewGroup;->setBackgroundColor(I)V

    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    new-instance v0, Lcom/google/android/material/timepicker/ClockFaceView$a;

    invoke-direct {v0, p0}, Lcom/google/android/material/timepicker/ClockFaceView$a;-><init>(Lcom/google/android/material/timepicker/ClockFaceView;)V

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 31
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 32
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 33
    new-instance p1, Lcom/google/android/material/timepicker/ClockFaceView$b;

    invoke-direct {p1, p0}, Lcom/google/android/material/timepicker/ClockFaceView$b;-><init>(Lcom/google/android/material/timepicker/ClockFaceView;)V

    iput-object p1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->F:Lb/h/m/a;

    const/16 p1, 0xc

    new-array p1, p1, [Ljava/lang/String;

    const-string p2, ""

    .line 34
    invoke-static {p1, p2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    invoke-virtual {p0, p1, v5}, Lcom/google/android/material/timepicker/ClockFaceView;->a([Ljava/lang/String;I)V

    .line 36
    sget p1, Lc/a/a/a/d;->material_time_picker_minimum_screen_height:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->J:I

    .line 37
    sget p1, Lc/a/a/a/d;->material_time_picker_minimum_screen_width:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->K:I

    .line 38
    sget p1, Lc/a/a/a/d;->material_clock_size:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->L:I

    return-void

    :array_d0
    .array-data 4
        0x0
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static a(FFF)F
    .registers 3

    .line 12
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p0

    invoke-static {p0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcom/google/android/material/timepicker/ClockFaceView;)Lcom/google/android/material/timepicker/ClockHandView;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->B:Lcom/google/android/material/timepicker/ClockHandView;

    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/material/timepicker/ClockFaceView;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->I:I

    return p0
.end method

.method public static synthetic c(Lcom/google/android/material/timepicker/ClockFaceView;)Landroid/util/SparseArray;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    return-object p0
.end method


# virtual methods
.method public final a(Landroid/graphics/RectF;Landroid/graphics/RectF;)Landroid/graphics/RadialGradient;
    .registers 10

    .line 4
    invoke-static {p1, p2}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result p2

    if-nez p2, :cond_8

    const/4 p1, 0x0

    return-object p1

    .line 5
    :cond_8
    new-instance p2, Landroid/graphics/RadialGradient;

    .line 6
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->D:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    sub-float v1, v0, v1

    .line 7
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    iget-object v2, p0, Lcom/google/android/material/timepicker/ClockFaceView;->D:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float v2, v0, v2

    .line 8
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float v3, p1, v0

    iget-object v4, p0, Lcom/google/android/material/timepicker/ClockFaceView;->G:[I

    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockFaceView;->H:[F

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v0, p2

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    return-object p2
.end method

.method public a(FZ)V
    .registers 4

    .line 9
    iget p2, p0, Lcom/google/android/material/timepicker/ClockFaceView;->N:F

    sub-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    const v0, 0x3a83126f    # 0.001f

    cmpl-float p2, p2, v0

    if-lez p2, :cond_13

    .line 10
    iput p1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->N:F

    .line 11
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockFaceView;->i()V

    :cond_13
    return-void
.end method

.method public a([Ljava/lang/String;I)V
    .registers 3

    .line 2
    iput-object p1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->M:[Ljava/lang/String;

    .line 3
    invoke-virtual {p0, p2}, Lcom/google/android/material/timepicker/ClockFaceView;->e(I)V

    return-void
.end method

.method public d(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/RadialViewGroup;->f()I

    move-result v0

    if-eq p1, v0, :cond_12

    .line 2
    invoke-super {p0, p1}, Lcom/google/android/material/timepicker/RadialViewGroup;->d(I)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->B:Lcom/google/android/material/timepicker/ClockHandView;

    invoke-virtual {p0}, Lcom/google/android/material/timepicker/RadialViewGroup;->f()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/timepicker/ClockHandView;->a(I)V

    :cond_12
    return-void
.end method

.method public final e(I)V
    .registers 10

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 3
    :goto_10
    iget-object v4, p0, Lcom/google/android/material/timepicker/ClockFaceView;->M:[Ljava/lang/String;

    array-length v4, v4

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    if-ge v3, v4, :cond_77

    .line 4
    iget-object v4, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 5
    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockFaceView;->M:[Ljava/lang/String;

    array-length v5, v5

    if-lt v3, v5, :cond_2f

    .line 6
    invoke-virtual {p0, v4}, Landroidx/constraintlayout/widget/ConstraintLayout;->removeView(Landroid/view/View;)V

    .line 7
    iget-object v4, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_74

    :cond_2f
    if-nez v4, :cond_41

    .line 8
    sget v4, Lc/a/a/a/h;->material_clockface_textview:I

    invoke-virtual {v0, v4, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 9
    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    invoke-virtual {v5, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 10
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 11
    :cond_41
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 12
    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockFaceView;->M:[Ljava/lang/String;

    aget-object v5, v5, v3

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    sget v5, Lc/a/a/a/f;->material_value_index:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    .line 14
    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockFaceView;->F:Lb/h/m/a;

    invoke-static {v4, v5}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    .line 15
    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockFaceView;->O:Landroid/content/res/ColorStateList;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    if-eqz p1, :cond_74

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    .line 17
    iget-object v7, p0, Lcom/google/android/material/timepicker/ClockFaceView;->M:[Ljava/lang/String;

    aget-object v7, v7, v3

    aput-object v7, v6, v2

    invoke-virtual {v5, p1, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_74
    :goto_74
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_77
    return-void
.end method

.method public final i()V
    .registers 7

    .line 1
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->B:Lcom/google/android/material/timepicker/ClockHandView;

    invoke-virtual {v0}, Lcom/google/android/material/timepicker/ClockHandView;->a()Landroid/graphics/RectF;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    :goto_7
    iget-object v2, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_4b

    .line 3
    iget-object v2, p0, Lcom/google/android/material/timepicker/ClockFaceView;->E:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-nez v2, :cond_1a

    goto :goto_48

    .line 4
    :cond_1a
    iget-object v3, p0, Lcom/google/android/material/timepicker/ClockFaceView;->C:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 5
    iget-object v3, p0, Lcom/google/android/material/timepicker/ClockFaceView;->C:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v4

    invoke-virtual {v2}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 6
    iget-object v3, p0, Lcom/google/android/material/timepicker/ClockFaceView;->C:Landroid/graphics/Rect;

    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 7
    iget-object v3, p0, Lcom/google/android/material/timepicker/ClockFaceView;->D:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/google/android/material/timepicker/ClockFaceView;->C:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 8
    iget-object v3, p0, Lcom/google/android/material/timepicker/ClockFaceView;->D:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v3}, Lcom/google/android/material/timepicker/ClockFaceView;->a(Landroid/graphics/RectF;Landroid/graphics/RectF;)Landroid/graphics/RadialGradient;

    move-result-object v3

    .line 9
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 10
    invoke-virtual {v2}, Landroid/widget/TextView;->invalidate()V

    :goto_48
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_4b
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    invoke-static {p1}, Lb/h/m/h0/c;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)Lb/h/m/h0/c;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->M:[Ljava/lang/String;

    array-length v0, v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 4
    invoke-static {v1, v0, v2, v1}, Lb/h/m/h0/c$b;->a(IIZI)Lb/h/m/h0/c$b;

    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public onLayout(ZIIII)V
    .registers 6

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockFaceView;->i()V

    return-void
.end method

.method public onMeasure(II)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    .line 3
    iget p2, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p2, p2

    .line 4
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    .line 5
    iget v0, p0, Lcom/google/android/material/timepicker/ClockFaceView;->L:I

    int-to-float v0, v0

    iget v1, p0, Lcom/google/android/material/timepicker/ClockFaceView;->J:I

    int-to-float v1, v1

    div-float/2addr v1, p2

    iget p2, p0, Lcom/google/android/material/timepicker/ClockFaceView;->K:I

    int-to-float p2, p2

    div-float/2addr p2, p1

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {v1, p2, p1}, Lcom/google/android/material/timepicker/ClockFaceView;->a(FFF)F

    move-result p1

    div-float/2addr v0, p1

    float-to-int p1, v0

    const/high16 p2, 0x40000000    # 2.0f

    .line 6
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 7
    invoke-virtual {p0, p1, p1}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 8
    invoke-super {p0, p2, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    return-void
.end method
