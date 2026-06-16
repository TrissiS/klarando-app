.class public Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;
.super Lcom/google/android/material/appbar/HeaderBehavior;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/appbar/AppBarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BaseBehavior"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;,
        Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/google/android/material/appbar/AppBarLayout;",
        ">",
        "Lcom/google/android/material/appbar/HeaderBehavior<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public k:I

.field public l:I

.field public m:Landroid/animation/ValueAnimator;

.field public n:I

.field public o:Z

.field public p:F

.field public q:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$d;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/appbar/HeaderBehavior;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->n:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 3
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/appbar/HeaderBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 4
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->n:I

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->k:I

    return p0
.end method

.method public static a(II)Z
    .registers 2

    and-int/2addr p0, p1

    if-ne p0, p1, :cond_5

    const/4 p0, 0x1

    goto :goto_6

    :cond_5
    const/4 p0, 0x0

    :goto_6
    return p0
.end method

.method public static c(Lcom/google/android/material/appbar/AppBarLayout;I)Landroid/view/View;
    .registers 6

    .line 10
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v0, :cond_1f

    .line 12
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    if-lt p1, v3, :cond_1c

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v3

    if-gt p1, v3, :cond_1c

    return-object v2

    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_1f
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;III)I
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;III)I"
        }
    .end annotation

    .line 96
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d()I

    move-result v0

    const/4 v1, 0x0

    if-eqz p4, :cond_48

    if-lt v0, p4, :cond_48

    if-gt v0, p5, :cond_48

    .line 97
    invoke-static {p3, p4, p5}, Lb/h/h/a;->a(III)I

    move-result v5

    if-eq v0, v5, :cond_4a

    .line 98
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->b()Z

    move-result p3

    if-eqz p3, :cond_1c

    .line 99
    invoke-virtual {p0, p2, v5}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->b(Lcom/google/android/material/appbar/AppBarLayout;I)I

    move-result p3

    goto :goto_1d

    :cond_1c
    move p3, v5

    .line 100
    :goto_1d
    invoke-virtual {p0, p3}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->a(I)Z

    move-result p4

    sub-int v1, v0, v5

    sub-int p3, v5, p3

    .line 101
    iput p3, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->k:I

    if-nez p4, :cond_32

    .line 102
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->b()Z

    move-result p3

    if-eqz p3, :cond_32

    .line 103
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;)V

    .line 104
    :cond_32
    invoke-virtual {p0}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->b()I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/google/android/material/appbar/AppBarLayout;->a(I)V

    if-ge v5, v0, :cond_3e

    const/4 p3, -0x1

    const/4 v6, -0x1

    goto :goto_40

    :cond_3e
    const/4 p3, 0x1

    const/4 v6, 0x1

    :goto_40
    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    .line 105
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IIZ)V

    goto :goto_4a

    .line 106
    :cond_48
    iput v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->k:I

    .line 107
    :cond_4a
    :goto_4a
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->e(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V

    return v1
.end method

.method public final a(Lcom/google/android/material/appbar/AppBarLayout;I)I
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)I"
        }
    .end annotation

    .line 43
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_34

    .line 44
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    .line 46
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v4

    .line 47
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 48
    invoke-virtual {v2}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->a()I

    move-result v5

    const/16 v6, 0x20

    invoke-static {v5, v6}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(II)Z

    move-result v5

    if-eqz v5, :cond_2b

    .line 49
    iget v5, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    sub-int/2addr v3, v5

    .line 50
    iget v2, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v4, v2

    :cond_2b
    neg-int v2, p2

    if-gt v3, v2, :cond_31

    if-lt v4, v2, :cond_31

    return v1

    :cond_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_34
    const/4 p1, -0x1

    return p1
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)Landroid/view/View;
    .registers 6

    .line 119
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1c

    .line 120
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 121
    instance-of v3, v2, Lb/h/m/m;

    if-nez v3, :cond_1b

    instance-of v3, v2, Landroid/widget/ListView;

    if-nez v3, :cond_1b

    instance-of v3, v2, Landroid/widget/ScrollView;

    if-eqz v3, :cond_18

    goto :goto_1b

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1b
    :goto_1b
    return-object v2

    :cond_1c
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V
    .registers 4

    .line 7
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/os/Parcelable;)V

    return-void
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    .line 8
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;I)V

    return-void
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIIII[I)V
    .registers 10

    .line 6
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual/range {p0 .. p9}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;IIIII[I)V

    return-void
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V
    .registers 8

    .line 5
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual/range {p0 .. p7}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;II[II)V

    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;)V"
        }
    .end annotation

    .line 93
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V

    .line 94
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->f()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 95
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Landroid/view/View;)Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Z)Z

    :cond_14
    return-void
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IF)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;IF)V"
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d()I

    move-result v0

    sub-int/2addr v0, p3

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 28
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p4

    const/4 v1, 0x0

    cmpl-float v1, p4, v1

    if-lez v1, :cond_1f

    const/high16 v1, 0x447a0000    # 1000.0f

    int-to-float v0, v0

    div-float/2addr v0, p4

    mul-float v0, v0, v1

    .line 29
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p4

    mul-int/lit8 p4, p4, 0x3

    goto :goto_2e

    :cond_1f
    int-to-float p4, v0

    .line 30
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p4, v0

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p4, v0

    const/high16 v0, 0x43160000    # 150.0f

    mul-float p4, p4, v0

    float-to-int p4, p4

    .line 31
    :goto_2e
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;II)V

    return-void
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;II)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;II)V"
        }
    .end annotation

    .line 32
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d()I

    move-result v0

    if-ne v0, p3, :cond_16

    .line 33
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_15

    .line 34
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_15
    return-void

    .line 35
    :cond_16
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    if-nez v1, :cond_31

    .line 36
    new-instance v1, Landroid/animation/ValueAnimator;

    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    .line 37
    sget-object v2, Lc/a/a/a/m/a;->e:Landroid/animation/TimeInterpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 38
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$a;

    invoke-direct {v2, p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$a;-><init>(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_34

    .line 39
    :cond_31
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 40
    :goto_34
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    const/16 p2, 0x258

    invoke-static {p4, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    int-to-long v1, p2

    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 41
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    const/4 p2, 0x2

    new-array p2, p2, [I

    const/4 p4, 0x0

    aput v0, p2, p4

    const/4 p4, 0x1

    aput p3, p2, p4

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 42
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IIZ)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;IIZ)V"
        }
    .end annotation

    .line 108
    invoke-static {p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->c(Lcom/google/android/material/appbar/AppBarLayout;I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_60

    .line 109
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 110
    invoke-virtual {v1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->a()I

    move-result v1

    and-int/lit8 v2, v1, 0x1

    const/4 v3, 0x0

    if-eqz v2, :cond_41

    .line 111
    invoke-static {v0}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v2

    const/4 v4, 0x1

    if-lez p4, :cond_2f

    and-int/lit8 p4, v1, 0xc

    if-eqz p4, :cond_2f

    neg-int p3, p3

    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result p4

    sub-int/2addr p4, v2

    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    sub-int/2addr p4, v0

    if-lt p3, p4, :cond_41

    :goto_2d
    const/4 v3, 0x1

    goto :goto_41

    :cond_2f
    and-int/lit8 p4, v1, 0x2

    if-eqz p4, :cond_41

    neg-int p3, p3

    .line 113
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result p4

    sub-int/2addr p4, v2

    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    sub-int/2addr p4, v0

    if-lt p3, p4, :cond_41

    goto :goto_2d

    .line 114
    :cond_41
    :goto_41
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->f()Z

    move-result p3

    if-eqz p3, :cond_4f

    .line 115
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)Landroid/view/View;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/google/android/material/appbar/AppBarLayout;->b(Landroid/view/View;)Z

    move-result v3

    .line 116
    :cond_4f
    invoke-virtual {p2, v3}, Lcom/google/android/material/appbar/AppBarLayout;->b(Z)Z

    move-result p3

    if-nez p5, :cond_5d

    if-eqz p3, :cond_60

    .line 117
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)Z

    move-result p1

    if-eqz p1, :cond_60

    .line 118
    :cond_5d
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->jumpDrawablesToCurrentState()V

    :cond_60
    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/os/Parcelable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Landroid/os/Parcelable;",
            ")V"
        }
    .end annotation

    .line 122
    instance-of v0, p3, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;

    if-eqz v0, :cond_1a

    .line 123
    check-cast p3, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;

    .line 124
    invoke-virtual {p3}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, p1, p2, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 125
    iget p1, p3, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;->j:I

    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->n:I

    .line 126
    iget p1, p3, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;->k:F

    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->p:F

    .line 127
    iget-boolean p1, p3, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;->l:Z

    iput-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->o:Z

    goto :goto_20

    .line 128
    :cond_1a
    invoke-super {p0, p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    const/4 p1, -0x1

    .line 129
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->n:I

    :goto_20
    return-void
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 78
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d()I

    move-result v0

    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v1

    neg-int v1, v1

    const/4 v2, 0x1

    if-eq v0, v1, :cond_18

    .line 79
    invoke-virtual {p3, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 80
    sget-object v0, Lb/h/m/h0/c$a;->h:Lb/h/m/h0/c$a;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Lb/h/m/h0/c$a;Z)V

    .line 81
    :cond_18
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d()I

    move-result v0

    if-eqz v0, :cond_42

    const/4 v0, -0x1

    .line 82
    invoke-virtual {p3, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 83
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedPreScrollRange()I

    move-result v0

    neg-int v6, v0

    if-eqz v6, :cond_42

    .line 84
    sget-object v0, Lb/h/m/h0/c$a;->i:Lb/h/m/h0/c$a;

    const/4 v7, 0x0

    new-instance v8, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;-><init>(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;I)V

    invoke-static {p1, v0, v7, v8}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/h0/c$a;Ljava/lang/CharSequence;Lb/h/m/h0/f;)V

    goto :goto_42

    .line 85
    :cond_3d
    sget-object p3, Lb/h/m/h0/c$a;->i:Lb/h/m/h0/c$a;

    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Lb/h/m/h0/c$a;Z)V

    :cond_42
    :goto_42
    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Landroid/view/View;",
            "I)V"
        }
    .end annotation

    .line 22
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->l:I

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    if-ne p4, v0, :cond_17

    .line 23
    :cond_7
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V

    .line 24
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->f()Z

    move-result p1

    if-eqz p1, :cond_17

    .line 25
    invoke-virtual {p2, p3}, Lcom/google/android/material/appbar/AppBarLayout;->b(Landroid/view/View;)Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Z)Z

    .line 26
    :cond_17
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->q:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;IIIII[I)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Landroid/view/View;",
            "IIIII[I)V"
        }
    .end annotation

    if-gez p7, :cond_13

    const/4 p3, 0x1

    .line 20
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedScrollRange()I

    move-result p4

    neg-int v4, p4

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p7

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/appbar/HeaderBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I

    move-result p4

    aput p4, p9, p3

    :cond_13
    if-nez p7, :cond_18

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->e(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V

    :cond_18
    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;II[II)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Landroid/view/View;",
            "II[II)V"
        }
    .end annotation

    if-eqz p5, :cond_26

    if-gez p5, :cond_11

    .line 14
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result p4

    neg-int p4, p4

    .line 15
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedPreScrollRange()I

    move-result p7

    add-int/2addr p7, p4

    move v4, p4

    move v5, p7

    goto :goto_19

    .line 16
    :cond_11
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getUpNestedPreScrollRange()I

    move-result p4

    neg-int p4, p4

    const/4 p7, 0x0

    move v4, p4

    const/4 v5, 0x0

    :goto_19
    if-eq v4, v5, :cond_26

    const/4 p4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p5

    .line 17
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/appbar/HeaderBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I

    move-result p1

    aput p1, p6, p4

    .line 18
    :cond_26
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->f()Z

    move-result p1

    if-eqz p1, :cond_33

    .line 19
    invoke-virtual {p2, p3}, Lcom/google/android/material/appbar/AppBarLayout;->b(Landroid/view/View;)Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Z)Z

    :cond_33
    return-void
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Lb/h/m/h0/c$a;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Lb/h/m/h0/c$a;",
            "Z)V"
        }
    .end annotation

    .line 86
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$c;

    invoke-direct {v0, p0, p2, p4}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$c;-><init>(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;Lcom/google/android/material/appbar/AppBarLayout;Z)V

    const/4 p2, 0x0

    invoke-static {p1, p3, p2, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/h0/c$a;Ljava/lang/CharSequence;Lb/h/m/h0/f;)V

    return-void
.end method

.method public bridge synthetic a(Landroid/view/View;)Z
    .registers 2

    .line 2
    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Lcom/google/android/material/appbar/AppBarLayout;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 4

    .line 3
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;I)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIII)Z
    .registers 7

    .line 4
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual/range {p0 .. p6}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IIII)Z

    move-result p1

    return p1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;I)Z
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;I)Z"
        }
    .end annotation

    .line 56
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result p3

    .line 57
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getPendingAction()I

    move-result v0

    .line 58
    iget v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->n:I

    const/4 v2, 0x0

    if-ltz v1, :cond_3a

    and-int/lit8 v3, v0, 0x8

    if-nez v3, :cond_3a

    .line 59
    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v1

    neg-int v1, v1

    .line 61
    iget-boolean v3, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->o:Z

    if-eqz v3, :cond_28

    .line 62
    invoke-static {v0}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_35

    .line 63
    :cond_28
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v3, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->p:F

    mul-float v0, v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    :goto_35
    add-int/2addr v1, v0

    .line 64
    invoke-virtual {p0, p1, p2, v1}, Lcom/google/android/material/appbar/HeaderBehavior;->c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)I

    goto :goto_64

    :cond_3a
    if-eqz v0, :cond_64

    and-int/lit8 v1, v0, 0x4

    const/4 v3, 0x1

    if-eqz v1, :cond_43

    const/4 v1, 0x1

    goto :goto_44

    :cond_43
    const/4 v1, 0x0

    :goto_44
    and-int/lit8 v4, v0, 0x2

    const/4 v5, 0x0

    if-eqz v4, :cond_58

    .line 65
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getUpNestedPreScrollRange()I

    move-result v0

    neg-int v0, v0

    if-eqz v1, :cond_54

    .line 66
    invoke-virtual {p0, p1, p2, v0, v5}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IF)V

    goto :goto_64

    .line 67
    :cond_54
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/material/appbar/HeaderBehavior;->c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)I

    goto :goto_64

    :cond_58
    and-int/2addr v0, v3

    if-eqz v0, :cond_64

    if-eqz v1, :cond_61

    .line 68
    invoke-virtual {p0, p1, p2, v2, v5}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IF)V

    goto :goto_64

    .line 69
    :cond_61
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/android/material/appbar/HeaderBehavior;->c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)I

    .line 70
    :cond_64
    :goto_64
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->g()V

    const/4 v0, -0x1

    .line 71
    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->n:I

    .line 72
    invoke-virtual {p0}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->b()I

    move-result v0

    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v1

    neg-int v1, v1

    invoke-static {v0, v1, v2}, Lb/h/h/a;->a(III)I

    move-result v0

    .line 73
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->a(I)Z

    .line 74
    invoke-virtual {p0}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->b()I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .line 75
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IIZ)V

    .line 76
    invoke-virtual {p0}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->b()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/google/android/material/appbar/AppBarLayout;->a(I)V

    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->e(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V

    return p3
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IIII)Z
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;IIII)Z"
        }
    .end annotation

    .line 51
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 52
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_1a

    const/4 p5, 0x0

    .line 53
    invoke-static {p5, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    move-object v0, p1

    move-object v1, p2

    move v2, p3

    move v3, p4

    move v5, p6

    .line 54
    invoke-virtual/range {v0 .. v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;IIII)V

    const/4 p1, 0x1

    return p1

    .line 55
    :cond_1a
    invoke-super/range {p0 .. p6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIII)Z

    move-result p1

    return p1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;Landroid/view/View;II)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "II)Z"
        }
    .end annotation

    and-int/lit8 p4, p5, 0x2

    if-eqz p4, :cond_12

    .line 9
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->f()Z

    move-result p4

    if-nez p4, :cond_10

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_12

    :cond_10
    const/4 p1, 0x1

    goto :goto_13

    :cond_12
    const/4 p1, 0x0

    :goto_13
    if-eqz p1, :cond_1c

    .line 10
    iget-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->m:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_1c

    .line 11
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1c
    const/4 p2, 0x0

    .line 12
    iput-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->q:Ljava/lang/ref/WeakReference;

    .line 13
    iput p6, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->l:I

    return p1
.end method

.method public a(Lcom/google/android/material/appbar/AppBarLayout;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 87
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->r:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$d;

    if-eqz v0, :cond_9

    .line 88
    invoke-virtual {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$d;->a(Lcom/google/android/material/appbar/AppBarLayout;)Z

    move-result p1

    return p1

    .line 89
    :cond_9
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->q:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x1

    if-eqz p1, :cond_25

    .line 90
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_24

    .line 91
    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_24

    const/4 v1, -0x1

    .line 92
    invoke-virtual {p1, v1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p1

    if-nez p1, :cond_24

    goto :goto_25

    :cond_24
    const/4 v0, 0x0

    :cond_25
    :goto_25
    return v0
.end method

.method public bridge synthetic b(Landroid/view/View;)I
    .registers 2

    .line 1
    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->b(Lcom/google/android/material/appbar/AppBarLayout;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I
    .registers 6

    .line 3
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual/range {p0 .. p5}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;III)I

    move-result p1

    return p1
.end method

.method public b(Lcom/google/android/material/appbar/AppBarLayout;)I
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 6
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedScrollRange()I

    move-result p1

    neg-int p1, p1

    return p1
.end method

.method public final b(Lcom/google/android/material/appbar/AppBarLayout;I)I
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)I"
        }
    .end annotation

    .line 7
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 8
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_a
    if-ge v3, v1, :cond_72

    .line 9
    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 10
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 11
    invoke-virtual {v5}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->b()Landroid/view/animation/Interpolator;

    move-result-object v6

    .line 12
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v7

    if-lt v0, v7, :cond_6f

    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v7

    if-gt v0, v7, :cond_6f

    if-eqz v6, :cond_72

    .line 13
    invoke-virtual {v5}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->a()I

    move-result v1

    and-int/lit8 v3, v1, 0x1

    if-eqz v3, :cond_44

    .line 14
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v3

    iget v7, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v3, v7

    iget v5, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v3, v5

    add-int/2addr v2, v3

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_44

    .line 15
    invoke-static {v4}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v1

    sub-int/2addr v2, v1

    .line 16
    :cond_44
    invoke-static {v4}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 17
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p1

    sub-int/2addr v2, p1

    :cond_4f
    if-lez v2, :cond_72

    .line 18
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result p1

    sub-int/2addr v0, p1

    int-to-float p1, v2

    int-to-float v0, v0

    div-float/2addr v0, p1

    .line 19
    invoke-interface {v6, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    mul-float p1, p1, v0

    .line 20
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    .line 21
    invoke-static {p2}, Ljava/lang/Integer;->signum(I)I

    move-result p2

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v0

    add-int/2addr v0, p1

    mul-int p2, p2, v0

    return p2

    :cond_6f
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_72
    return p2
.end method

.method public b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)Landroid/os/Parcelable;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;)",
            "Landroid/os/Parcelable;"
        }
    .end annotation

    .line 22
    invoke-super {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    move-result-object p1

    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->b()I

    move-result v0

    .line 24
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_e
    if-ge v3, v1, :cond_44

    .line 25
    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 26
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v5

    add-int/2addr v5, v0

    .line 27
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v6

    add-int/2addr v6, v0

    if-gtz v6, :cond_41

    if-ltz v5, :cond_41

    .line 28
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;

    invoke-direct {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 29
    iput v3, v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;->j:I

    .line 30
    invoke-static {v4}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p2

    add-int/2addr p1, p2

    if-ne v5, p1, :cond_35

    const/4 v2, 0x1

    :cond_35
    iput-boolean v2, v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;->l:Z

    int-to-float p1, v5

    .line 31
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    iput p1, v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$SavedState;->k:F

    return-object v0

    :cond_41
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :cond_44
    return-object p1
.end method

.method public bridge synthetic b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)Z
    .registers 7

    .line 2
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual/range {p0 .. p6}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;Landroid/view/View;II)Z

    move-result p1

    return p1
.end method

.method public final b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;",
            "Landroid/view/View;",
            ")Z"
        }
    .end annotation

    .line 4
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->d()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p3

    sub-int/2addr p1, p3

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getHeight()I

    move-result p2

    if-gt p1, p2, :cond_17

    const/4 p1, 0x1

    goto :goto_18

    :cond_17
    const/4 p1, 0x0

    :goto_18
    return p1
.end method

.method public bridge synthetic c(Landroid/view/View;)I
    .registers 2

    .line 1
    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->c(Lcom/google/android/material/appbar/AppBarLayout;)I

    move-result p1

    return p1
.end method

.method public c(Lcom/google/android/material/appbar/AppBarLayout;)I
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 2
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result p1

    return p1
.end method

.method public final c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;)Z"
        }
    .end annotation

    .line 3
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c(Landroid/view/View;)Ljava/util/List;

    move-result-object p1

    .line 4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, p2, :cond_2d

    .line 5
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 6
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 7
    invoke-virtual {v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v2

    .line 8
    instance-of v3, v2, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;

    if-eqz v3, :cond_2a

    .line 9
    check-cast v2, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;

    invoke-virtual {v2}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->c()I

    move-result p1

    if-eqz p1, :cond_29

    const/4 v0, 0x1

    :cond_29
    return v0

    :cond_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_2d
    return v0
.end method

.method public d()I
    .registers 3

    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/appbar/ViewOffsetBehavior;->b()I

    move-result v0

    iget v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->k:I

    add-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;
    .registers 3

    .line 1
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)Landroid/os/Parcelable;

    move-result-object p1

    return-object p1
.end method

.method public final d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;)V"
        }
    .end annotation

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d()I

    move-result v0

    .line 3
    invoke-virtual {p0, p2, v0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Lcom/google/android/material/appbar/AppBarLayout;I)I

    move-result v1

    if-ltz v1, :cond_75

    .line 4
    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 5
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 6
    invoke-virtual {v3}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->a()I

    move-result v4

    and-int/lit8 v5, v4, 0x11

    const/16 v6, 0x11

    if-ne v5, v6, :cond_75

    .line 7
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v5

    neg-int v5, v5

    .line 8
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v6

    neg-int v6, v6

    .line 9
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ne v1, v7, :cond_35

    .line 10
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v1

    add-int/2addr v6, v1

    :cond_35
    const/4 v1, 0x2

    .line 11
    invoke-static {v4, v1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(II)Z

    move-result v7

    if-eqz v7, :cond_42

    .line 12
    invoke-static {v2}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v2

    add-int/2addr v6, v2

    goto :goto_53

    :cond_42
    const/4 v7, 0x5

    .line 13
    invoke-static {v4, v7}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(II)Z

    move-result v7

    if-eqz v7, :cond_53

    .line 14
    invoke-static {v2}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v2

    add-int/2addr v2, v6

    if-ge v0, v2, :cond_52

    move v5, v2

    goto :goto_53

    :cond_52
    move v6, v2

    :cond_53
    :goto_53
    const/16 v2, 0x20

    .line 15
    invoke-static {v4, v2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(II)Z

    move-result v2

    if-eqz v2, :cond_61

    .line 16
    iget v2, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v5, v2

    .line 17
    iget v2, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v6, v2

    :cond_61
    add-int v2, v6, v5

    .line 18
    div-int/2addr v2, v1

    if-ge v0, v2, :cond_67

    move v5, v6

    .line 19
    :cond_67
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    neg-int v0, v0

    const/4 v1, 0x0

    invoke-static {v5, v0, v1}, Lb/h/h/a;->a(III)I

    move-result v0

    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;IF)V

    :cond_75
    return-void
.end method

.method public bridge synthetic e(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)V
    .registers 3

    .line 1
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V

    return-void
.end method

.method public final e(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TT;)V"
        }
    .end annotation

    .line 2
    sget-object v0, Lb/h/m/h0/c$a;->h:Lb/h/m/h0/c$a;

    invoke-virtual {v0}, Lb/h/m/h0/c$a;->a()I

    move-result v0

    invoke-static {p1, v0}, Lb/h/m/y;->f(Landroid/view/View;I)V

    .line 3
    sget-object v0, Lb/h/m/h0/c$a;->i:Lb/h/m/h0/c$a;

    invoke-virtual {v0}, Lb/h/m/h0/c$a;->a()I

    move-result v0

    invoke-static {p1, v0}, Lb/h/m/y;->f(Landroid/view/View;I)V

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_31

    .line 5
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v1

    if-nez v1, :cond_1f

    goto :goto_31

    .line 6
    :cond_1f
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 7
    invoke-virtual {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v1

    instance-of v1, v1, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;

    if-nez v1, :cond_2e

    return-void

    .line 8
    :cond_2e
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;)V

    :cond_31
    :goto_31
    return-void
.end method
