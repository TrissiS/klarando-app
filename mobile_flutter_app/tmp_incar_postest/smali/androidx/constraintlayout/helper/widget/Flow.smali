.class public Landroidx/constraintlayout/helper/widget/Flow;
.super Landroidx/constraintlayout/widget/VirtualLayout;
.source "Flow.java"


# instance fields
.field public r:Lb/f/b/k/g;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/VirtualLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/VirtualLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/VirtualLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/util/AttributeSet;)V
    .registers 8

    .line 14
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/VirtualLayout;->a(Landroid/util/AttributeSet;)V

    .line 15
    new-instance v0, Lb/f/b/k/g;

    invoke-direct {v0}, Lb/f/b/k/g;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    if-eqz p1, :cond_1a7

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lb/f/c/f;->ConstraintLayout_Layout:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_1c
    if-ge v2, v0, :cond_1a7

    .line 18
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    .line 19
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_orientation:I

    if-ne v3, v4, :cond_31

    .line 20
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->I(I)V

    goto/16 :goto_1a3

    .line 21
    :cond_31
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_padding:I

    if-ne v3, v4, :cond_40

    .line 22
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/l;->t(I)V

    goto/16 :goto_1a3

    .line 23
    :cond_40
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_paddingStart:I

    if-ne v3, v4, :cond_4f

    .line 24
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/l;->y(I)V

    goto/16 :goto_1a3

    .line 25
    :cond_4f
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_paddingEnd:I

    if-ne v3, v4, :cond_5e

    .line 26
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/l;->v(I)V

    goto/16 :goto_1a3

    .line 27
    :cond_5e
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_paddingLeft:I

    if-ne v3, v4, :cond_6d

    .line 28
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/l;->w(I)V

    goto/16 :goto_1a3

    .line 29
    :cond_6d
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_paddingTop:I

    if-ne v3, v4, :cond_7c

    .line 30
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/l;->z(I)V

    goto/16 :goto_1a3

    .line 31
    :cond_7c
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_paddingRight:I

    if-ne v3, v4, :cond_8b

    .line 32
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/l;->x(I)V

    goto/16 :goto_1a3

    .line 33
    :cond_8b
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_android_paddingBottom:I

    if-ne v3, v4, :cond_9a

    .line 34
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/l;->u(I)V

    goto/16 :goto_1a3

    .line 35
    :cond_9a
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_wrapMode:I

    if-ne v3, v4, :cond_a9

    .line 36
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->M(I)V

    goto/16 :goto_1a3

    .line 37
    :cond_a9
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_horizontalStyle:I

    if-ne v3, v4, :cond_b8

    .line 38
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->E(I)V

    goto/16 :goto_1a3

    .line 39
    :cond_b8
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_verticalStyle:I

    if-ne v3, v4, :cond_c7

    .line 40
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->L(I)V

    goto/16 :goto_1a3

    .line 41
    :cond_c7
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_firstHorizontalStyle:I

    if-ne v3, v4, :cond_d6

    .line 42
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->A(I)V

    goto/16 :goto_1a3

    .line 43
    :cond_d6
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_lastHorizontalStyle:I

    if-ne v3, v4, :cond_e5

    .line 44
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->F(I)V

    goto/16 :goto_1a3

    .line 45
    :cond_e5
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_firstVerticalStyle:I

    if-ne v3, v4, :cond_f4

    .line 46
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->B(I)V

    goto/16 :goto_1a3

    .line 47
    :cond_f4
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_lastVerticalStyle:I

    if-ne v3, v4, :cond_103

    .line 48
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->G(I)V

    goto/16 :goto_1a3

    .line 49
    :cond_103
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_horizontalBias:I

    const/high16 v5, 0x3f000000    # 0.5f

    if-ne v3, v4, :cond_114

    .line 50
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->g(F)V

    goto/16 :goto_1a3

    .line 51
    :cond_114
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_firstHorizontalBias:I

    if-ne v3, v4, :cond_123

    .line 52
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->e(F)V

    goto/16 :goto_1a3

    .line 53
    :cond_123
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_lastHorizontalBias:I

    if-ne v3, v4, :cond_132

    .line 54
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->h(F)V

    goto/16 :goto_1a3

    .line 55
    :cond_132
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_firstVerticalBias:I

    if-ne v3, v4, :cond_140

    .line 56
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->f(F)V

    goto :goto_1a3

    .line 57
    :cond_140
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_lastVerticalBias:I

    if-ne v3, v4, :cond_14e

    .line 58
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->i(F)V

    goto :goto_1a3

    .line 59
    :cond_14e
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_verticalBias:I

    if-ne v3, v4, :cond_15c

    .line 60
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->j(F)V

    goto :goto_1a3

    .line 61
    :cond_15c
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_horizontalAlign:I

    const/4 v5, 0x2

    if-ne v3, v4, :cond_16b

    .line 62
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->C(I)V

    goto :goto_1a3

    .line 63
    :cond_16b
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_verticalAlign:I

    if-ne v3, v4, :cond_179

    .line 64
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->J(I)V

    goto :goto_1a3

    .line 65
    :cond_179
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_horizontalGap:I

    if-ne v3, v4, :cond_187

    .line 66
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->D(I)V

    goto :goto_1a3

    .line 67
    :cond_187
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_verticalGap:I

    if-ne v3, v4, :cond_195

    .line 68
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->K(I)V

    goto :goto_1a3

    .line 69
    :cond_195
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_flow_maxElementsWrap:I

    if-ne v3, v4, :cond_1a3

    .line 70
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    const/4 v5, -0x1

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/g;->H(I)V

    :cond_1a3
    :goto_1a3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1c

    .line 71
    :cond_1a7
    iget-object p1, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintHelper;->k:Lb/f/b/k/i;

    .line 72
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintHelper;->b()V

    return-void
.end method

.method public a(Lb/f/b/k/e;Z)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p1, p2}, Lb/f/b/k/l;->d(Z)V

    return-void
.end method

.method public a(Lb/f/b/k/l;II)V
    .registers 6

    .line 2
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 3
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 4
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 5
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p3

    if-eqz p1, :cond_21

    .line 6
    invoke-virtual {p1, v0, p2, v1, p3}, Lb/f/b/k/l;->b(IIII)V

    .line 7
    invoke-virtual {p1}, Lb/f/b/k/l;->L()I

    move-result p2

    invoke-virtual {p1}, Lb/f/b/k/l;->K()I

    move-result p1

    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    goto :goto_25

    :cond_21
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    :goto_25
    return-void
.end method

.method public a(Lb/f/c/c$a;Lb/f/b/k/j;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/c/c$a;",
            "Lb/f/b/k/j;",
            "Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;",
            "Landroid/util/SparseArray<",
            "Lb/f/b/k/e;",
            ">;)V"
        }
    .end annotation

    .line 9
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintHelper;->a(Lb/f/c/c$a;Lb/f/b/k/j;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V

    .line 10
    instance-of p1, p2, Lb/f/b/k/g;

    if-eqz p1, :cond_11

    .line 11
    check-cast p2, Lb/f/b/k/g;

    .line 12
    iget p1, p3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    const/4 p3, -0x1

    if-eq p1, p3, :cond_11

    .line 13
    invoke-virtual {p2, p1}, Lb/f/b/k/g;->I(I)V

    :cond_11
    return-void
.end method

.method public onMeasure(II)V
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {p0, v0, p1, p2}, Landroidx/constraintlayout/helper/widget/Flow;->a(Lb/f/b/k/l;II)V

    return-void
.end method

.method public setFirstHorizontalBias(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->e(F)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setFirstHorizontalStyle(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->A(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setFirstVerticalBias(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->f(F)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setFirstVerticalStyle(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->B(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setHorizontalAlign(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->C(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setHorizontalBias(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->g(F)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setHorizontalGap(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->D(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setHorizontalStyle(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->E(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setMaxElementsWrap(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->H(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setOrientation(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->I(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setPadding(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/l;->t(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setPaddingBottom(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/l;->u(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setPaddingLeft(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/l;->w(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setPaddingRight(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/l;->x(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setPaddingTop(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/l;->z(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setVerticalAlign(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->J(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setVerticalBias(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->j(F)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setVerticalGap(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->K(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setVerticalStyle(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->L(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setWrapMode(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lb/f/b/k/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/g;->M(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method
