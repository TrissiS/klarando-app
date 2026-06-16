.class public abstract Lb/b/q/a;
.super Landroid/view/ViewGroup;
.source "AbsActionBarView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/b/q/a$a;
    }
.end annotation


# instance fields
.field public final h:Lb/b/q/a$a;

.field public final i:Landroid/content/Context;

.field public j:Landroidx/appcompat/widget/ActionMenuView;

.field public k:Landroidx/appcompat/widget/ActionMenuPresenter;

.field public l:I

.field public m:Lb/h/m/c0;

.field public n:Z

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lb/b/q/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lb/b/q/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p2, Lb/b/q/a$a;

    invoke-direct {p2, p0}, Lb/b/q/a$a;-><init>(Lb/b/q/a;)V

    iput-object p2, p0, Lb/b/q/a;->h:Lb/b/q/a$a;

    .line 5
    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p3

    sget v0, Lb/b/a;->actionBarPopupTheme:I

    const/4 v1, 0x1

    invoke-virtual {p3, v0, p2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p3

    if-eqz p3, :cond_2a

    iget p3, p2, Landroid/util/TypedValue;->resourceId:I

    if-eqz p3, :cond_2a

    .line 7
    new-instance p3, Landroid/view/ContextThemeWrapper;

    iget p2, p2, Landroid/util/TypedValue;->resourceId:I

    invoke-direct {p3, p1, p2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object p3, p0, Lb/b/q/a;->i:Landroid/content/Context;

    goto :goto_2c

    .line 8
    :cond_2a
    iput-object p1, p0, Lb/b/q/a;->i:Landroid/content/Context;

    :goto_2c
    return-void
.end method

.method public static a(IIZ)I
    .registers 3

    if-eqz p2, :cond_4

    sub-int/2addr p0, p1

    goto :goto_5

    :cond_4
    add-int/2addr p0, p1

    :goto_5
    return p0
.end method

.method public static synthetic a(Lb/b/q/a;I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    return-void
.end method

.method public static synthetic b(Lb/b/q/a;I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;III)I
    .registers 6

    const/high16 v0, -0x80000000

    .line 12
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p1, v0, p3}, Landroid/view/View;->measure(II)V

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    sub-int/2addr p2, p1

    sub-int/2addr p2, p4

    const/4 p1, 0x0

    .line 14
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    return p1
.end method

.method public a(Landroid/view/View;IIIZ)I
    .registers 8

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    sub-int/2addr p4, v1

    .line 17
    div-int/lit8 p4, p4, 0x2

    add-int/2addr p3, p4

    if-eqz p5, :cond_15

    sub-int p4, p2, v0

    add-int/2addr v1, p3

    .line 18
    invoke-virtual {p1, p4, p3, p2, v1}, Landroid/view/View;->layout(IIII)V

    goto :goto_1b

    :cond_15
    add-int p4, p2, v0

    add-int/2addr v1, p3

    .line 19
    invoke-virtual {p1, p2, p3, p4, v1}, Landroid/view/View;->layout(IIII)V

    :goto_1b
    if-eqz p5, :cond_1e

    neg-int v0, v0

    :cond_1e
    return v0
.end method

.method public a(IJ)Lb/h/m/c0;
    .registers 6

    .line 2
    iget-object v0, p0, Lb/b/q/a;->m:Lb/h/m/c0;

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {v0}, Lb/h/m/c0;->a()V

    :cond_7
    const/4 v0, 0x0

    if-nez p1, :cond_28

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_13

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 6
    :cond_13
    invoke-static {p0}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lb/h/m/c0;->a(F)Lb/h/m/c0;

    .line 7
    invoke-virtual {v0, p2, p3}, Lb/h/m/c0;->a(J)Lb/h/m/c0;

    .line 8
    iget-object p2, p0, Lb/b/q/a;->h:Lb/b/q/a$a;

    invoke-virtual {p2, v0, p1}, Lb/b/q/a$a;->a(Lb/h/m/c0;I)Lb/b/q/a$a;

    invoke-virtual {v0, p2}, Lb/h/m/c0;->a(Lb/h/m/d0;)Lb/h/m/c0;

    return-object v0

    .line 9
    :cond_28
    invoke-static {p0}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object v1

    invoke-virtual {v1, v0}, Lb/h/m/c0;->a(F)Lb/h/m/c0;

    .line 10
    invoke-virtual {v1, p2, p3}, Lb/h/m/c0;->a(J)Lb/h/m/c0;

    .line 11
    iget-object p2, p0, Lb/b/q/a;->h:Lb/b/q/a$a;

    invoke-virtual {p2, v1, p1}, Lb/b/q/a$a;->a(Lb/h/m/c0;I)Lb/b/q/a$a;

    invoke-virtual {v1, p2}, Lb/h/m/c0;->a(Lb/h/m/d0;)Lb/h/m/c0;

    return-object v1
.end method

.method public getAnimatedVisibility()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/a;->m:Lb/h/m/c0;

    if-eqz v0, :cond_9

    .line 2
    iget-object v0, p0, Lb/b/q/a;->h:Lb/b/q/a$a;

    iget v0, v0, Lb/b/q/a$a;->b:I

    return v0

    .line 3
    :cond_9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    return v0
.end method

.method public getContentHeight()I
    .registers 2

    .line 1
    iget v0, p0, Lb/b/q/a;->l:I

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lb/b/j;->ActionBar:[I

    sget v2, Lb/b/a;->actionBarStyle:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 3
    sget v1, Lb/b/j;->ActionBar_height:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lb/b/q/a;->setContentHeight(I)V

    .line 4
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 5
    iget-object v0, p0, Lb/b/q/a;->k:Landroidx/appcompat/widget/ActionMenuPresenter;

    if-eqz v0, :cond_24

    .line 6
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionMenuPresenter;->a(Landroid/content/res/Configuration;)V

    :cond_24
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x9

    if-ne v0, v2, :cond_b

    .line 2
    iput-boolean v1, p0, Lb/b/q/a;->o:Z

    .line 3
    :cond_b
    iget-boolean v3, p0, Lb/b/q/a;->o:Z

    const/4 v4, 0x1

    if-nez v3, :cond_1a

    .line 4
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-ne v0, v2, :cond_1a

    if-nez p1, :cond_1a

    .line 5
    iput-boolean v4, p0, Lb/b/q/a;->o:Z

    :cond_1a
    const/16 p1, 0xa

    if-eq v0, p1, :cond_21

    const/4 p1, 0x3

    if-ne v0, p1, :cond_23

    .line 6
    :cond_21
    iput-boolean v1, p0, Lb/b/q/a;->o:Z

    :cond_23
    return v4
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    .line 2
    iput-boolean v1, p0, Lb/b/q/a;->n:Z

    .line 3
    :cond_9
    iget-boolean v2, p0, Lb/b/q/a;->n:Z

    const/4 v3, 0x1

    if-nez v2, :cond_18

    .line 4
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-nez v0, :cond_18

    if-nez p1, :cond_18

    .line 5
    iput-boolean v3, p0, Lb/b/q/a;->n:Z

    :cond_18
    if-eq v0, v3, :cond_1d

    const/4 p1, 0x3

    if-ne v0, p1, :cond_1f

    .line 6
    :cond_1d
    iput-boolean v1, p0, Lb/b/q/a;->n:Z

    :cond_1f
    return v3
.end method

.method public abstract setContentHeight(I)V
.end method

.method public setVisibility(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eq p1, v0, :cond_10

    .line 2
    iget-object v0, p0, Lb/b/q/a;->m:Lb/h/m/c0;

    if-eqz v0, :cond_d

    .line 3
    invoke-virtual {v0}, Lb/h/m/c0;->a()V

    .line 4
    :cond_d
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_10
    return-void
.end method
