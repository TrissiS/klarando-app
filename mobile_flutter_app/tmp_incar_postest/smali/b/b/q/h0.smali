.class public Lb/b/q/h0;
.super Ljava/lang/Object;
.source "ToolbarWidgetWrapper.java"

# interfaces
.implements Lb/b/q/p;


# instance fields
.field public a:Landroidx/appcompat/widget/Toolbar;

.field public b:I

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Landroid/graphics/drawable/Drawable;

.field public g:Landroid/graphics/drawable/Drawable;

.field public h:Z

.field public i:Ljava/lang/CharSequence;

.field public j:Ljava/lang/CharSequence;

.field public k:Ljava/lang/CharSequence;

.field public l:Landroid/view/Window$Callback;

.field public m:Z

.field public n:Landroidx/appcompat/widget/ActionMenuPresenter;

.field public o:I

.field public p:I

.field public q:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/Toolbar;Z)V
    .registers 5

    .line 1
    sget v0, Lb/b/h;->abc_action_bar_up_description:I

    sget v1, Lb/b/e;->abc_ic_ab_back_material:I

    invoke-direct {p0, p1, p2, v0, v1}, Lb/b/q/h0;-><init>(Landroidx/appcompat/widget/Toolbar;ZII)V

    return-void
.end method

.method public constructor <init>(Landroidx/appcompat/widget/Toolbar;ZII)V
    .registers 8

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p4, 0x0

    .line 3
    iput p4, p0, Lb/b/q/h0;->o:I

    .line 4
    iput p4, p0, Lb/b/q/h0;->p:I

    .line 5
    iput-object p1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    .line 6
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lb/b/q/h0;->i:Ljava/lang/CharSequence;

    .line 7
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lb/b/q/h0;->j:Ljava/lang/CharSequence;

    .line 8
    iget-object v0, p0, Lb/b/q/h0;->i:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    iput-boolean v0, p0, Lb/b/q/h0;->h:Z

    .line 9
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lb/b/q/h0;->g:Landroid/graphics/drawable/Drawable;

    .line 10
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x0

    sget-object v1, Lb/b/j;->ActionBar:[I

    sget v2, Lb/b/a;->actionBarStyle:I

    invoke-static {p1, v0, v1, v2, p4}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Lb/b/q/g0;

    move-result-object p1

    .line 11
    sget v0, Lb/b/j;->ActionBar_homeAsUpIndicator:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lb/b/q/h0;->q:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_109

    .line 12
    sget p2, Lb/b/j;->ActionBar_title:I

    invoke-virtual {p1, p2}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object p2

    .line 13
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4b

    .line 14
    invoke-virtual {p0, p2}, Lb/b/q/h0;->c(Ljava/lang/CharSequence;)V

    .line 15
    :cond_4b
    sget p2, Lb/b/j;->ActionBar_subtitle:I

    invoke-virtual {p1, p2}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object p2

    .line 16
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5a

    .line 17
    invoke-virtual {p0, p2}, Lb/b/q/h0;->b(Ljava/lang/CharSequence;)V

    .line 18
    :cond_5a
    sget p2, Lb/b/j;->ActionBar_logo:I

    invoke-virtual {p1, p2}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_65

    .line 19
    invoke-virtual {p0, p2}, Lb/b/q/h0;->a(Landroid/graphics/drawable/Drawable;)V

    .line 20
    :cond_65
    sget p2, Lb/b/j;->ActionBar_icon:I

    invoke-virtual {p1, p2}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_70

    .line 21
    invoke-virtual {p0, p2}, Lb/b/q/h0;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 22
    :cond_70
    iget-object p2, p0, Lb/b/q/h0;->g:Landroid/graphics/drawable/Drawable;

    if-nez p2, :cond_7b

    iget-object p2, p0, Lb/b/q/h0;->q:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_7b

    .line 23
    invoke-virtual {p0, p2}, Lb/b/q/h0;->b(Landroid/graphics/drawable/Drawable;)V

    .line 24
    :cond_7b
    sget p2, Lb/b/j;->ActionBar_displayOptions:I

    invoke-virtual {p1, p2, p4}, Lb/b/q/g0;->d(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lb/b/q/h0;->b(I)V

    .line 25
    sget p2, Lb/b/j;->ActionBar_customNavigationLayout:I

    invoke-virtual {p1, p2, p4}, Lb/b/q/g0;->g(II)I

    move-result p2

    if-eqz p2, :cond_a6

    .line 26
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, p2, v1, p4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p0, p2}, Lb/b/q/h0;->a(Landroid/view/View;)V

    .line 27
    iget p2, p0, Lb/b/q/h0;->b:I

    or-int/lit8 p2, p2, 0x10

    invoke-virtual {p0, p2}, Lb/b/q/h0;->b(I)V

    .line 28
    :cond_a6
    sget p2, Lb/b/j;->ActionBar_height:I

    invoke-virtual {p1, p2, p4}, Lb/b/q/g0;->f(II)I

    move-result p2

    if-lez p2, :cond_bb

    .line 29
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 30
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 31
    iget-object p2, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    :cond_bb
    sget p2, Lb/b/j;->ActionBar_contentInsetStart:I

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Lb/b/q/g0;->b(II)I

    move-result p2

    .line 33
    sget v1, Lb/b/j;->ActionBar_contentInsetEnd:I

    invoke-virtual {p1, v1, v0}, Lb/b/q/g0;->b(II)I

    move-result v0

    if-gez p2, :cond_cc

    if-ltz v0, :cond_d9

    .line 34
    :cond_cc
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-static {p2, p4}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 35
    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 36
    invoke-virtual {v1, p2, v0}, Landroidx/appcompat/widget/Toolbar;->a(II)V

    .line 37
    :cond_d9
    sget p2, Lb/b/j;->ActionBar_titleTextStyle:I

    invoke-virtual {p1, p2, p4}, Lb/b/q/g0;->g(II)I

    move-result p2

    if-eqz p2, :cond_ea

    .line 38
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroidx/appcompat/widget/Toolbar;->b(Landroid/content/Context;I)V

    .line 39
    :cond_ea
    sget p2, Lb/b/j;->ActionBar_subtitleTextStyle:I

    invoke-virtual {p1, p2, p4}, Lb/b/q/g0;->g(II)I

    move-result p2

    if-eqz p2, :cond_fb

    .line 40
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroidx/appcompat/widget/Toolbar;->a(Landroid/content/Context;I)V

    .line 41
    :cond_fb
    sget p2, Lb/b/j;->ActionBar_popupTheme:I

    invoke-virtual {p1, p2, p4}, Lb/b/q/g0;->g(II)I

    move-result p2

    if-eqz p2, :cond_10f

    .line 42
    iget-object p4, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p4, p2}, Landroidx/appcompat/widget/Toolbar;->setPopupTheme(I)V

    goto :goto_10f

    .line 43
    :cond_109
    invoke-virtual {p0}, Lb/b/q/h0;->n()I

    move-result p2

    iput p2, p0, Lb/b/q/h0;->b:I

    .line 44
    :cond_10f
    :goto_10f
    invoke-virtual {p1}, Lb/b/q/g0;->b()V

    .line 45
    invoke-virtual {p0, p3}, Lb/b/q/h0;->c(I)V

    .line 46
    iget-object p1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getNavigationContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lb/b/q/h0;->k:Ljava/lang/CharSequence;

    .line 47
    iget-object p1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    new-instance p2, Lb/b/q/h0$a;

    invoke-direct {p2, p0}, Lb/b/q/h0$a;-><init>(Lb/b/q/h0;)V

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public a(IJ)Lb/h/m/c0;
    .registers 6

    .line 25
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-static {v0}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object v0

    if-nez p1, :cond_b

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    .line 26
    :goto_c
    invoke-virtual {v0, v1}, Lb/h/m/c0;->a(F)Lb/h/m/c0;

    .line 27
    invoke-virtual {v0, p2, p3}, Lb/h/m/c0;->a(J)Lb/h/m/c0;

    new-instance p2, Lb/b/q/h0$b;

    invoke-direct {p2, p0, p1}, Lb/b/q/h0$b;-><init>(Lb/b/q/h0;I)V

    .line 28
    invoke-virtual {v0, p2}, Lb/h/m/c0;->a(Lb/h/m/d0;)Lb/h/m/c0;

    return-object v0
.end method

.method public a(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Lb/b/q/h0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lb/b/q/h0;->a(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 2
    iput-object p1, p0, Lb/b/q/h0;->f:Landroid/graphics/drawable/Drawable;

    .line 3
    invoke-virtual {p0}, Lb/b/q/h0;->q()V

    return-void
.end method

.method public a(Landroid/view/Menu;Lb/b/p/j/m$a;)V
    .registers 5

    .line 5
    iget-object v0, p0, Lb/b/q/h0;->n:Landroidx/appcompat/widget/ActionMenuPresenter;

    if-nez v0, :cond_16

    .line 6
    new-instance v0, Landroidx/appcompat/widget/ActionMenuPresenter;

    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/ActionMenuPresenter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lb/b/q/h0;->n:Landroidx/appcompat/widget/ActionMenuPresenter;

    .line 7
    sget v1, Lb/b/f;->action_menu_presenter:I

    invoke-virtual {v0, v1}, Lb/b/p/j/b;->a(I)V

    .line 8
    :cond_16
    iget-object v0, p0, Lb/b/q/h0;->n:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-virtual {v0, p2}, Lb/b/p/j/b;->a(Lb/b/p/j/m$a;)V

    .line 9
    iget-object p2, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    check-cast p1, Lb/b/p/j/g;

    iget-object v0, p0, Lb/b/q/h0;->n:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-virtual {p2, p1, v0}, Landroidx/appcompat/widget/Toolbar;->a(Lb/b/p/j/g;Landroidx/appcompat/widget/ActionMenuPresenter;)V

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 4

    .line 20
    iget-object v0, p0, Lb/b/q/h0;->d:Landroid/view/View;

    if-eqz v0, :cond_f

    iget v1, p0, Lb/b/q/h0;->b:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_f

    .line 21
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    :cond_f
    iput-object p1, p0, Lb/b/q/h0;->d:Landroid/view/View;

    if-eqz p1, :cond_1e

    .line 23
    iget v0, p0, Lb/b/q/h0;->b:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_1e

    .line 24
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_1e
    return-void
.end method

.method public a(Lb/b/q/z;)V
    .registers 4

    .line 10
    iget-object v0, p0, Lb/b/q/h0;->c:Landroid/view/View;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    if-ne v0, v1, :cond_11

    .line 11
    iget-object v0, p0, Lb/b/q/h0;->c:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 12
    :cond_11
    iput-object p1, p0, Lb/b/q/h0;->c:Landroid/view/View;

    if-eqz p1, :cond_36

    .line 13
    iget v0, p0, Lb/b/q/h0;->o:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_36

    .line 14
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 15
    iget-object v0, p0, Lb/b/q/h0;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/Toolbar$LayoutParams;

    const/4 v1, -0x2

    .line 16
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 17
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const v1, 0x800053

    .line 18
    iput v1, v0, Landroidx/appcompat/app/ActionBar$LayoutParams;->a:I

    const/4 v0, 0x1

    .line 19
    invoke-virtual {p1, v0}, Lb/b/q/z;->setAllowCollapse(Z)V

    :cond_36
    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 2

    .line 29
    iput-object p1, p0, Lb/b/q/h0;->k:Ljava/lang/CharSequence;

    .line 30
    invoke-virtual {p0}, Lb/b/q/h0;->o()V

    return-void
.end method

.method public a(Z)V
    .registers 2

    return-void
.end method

.method public a()Z
    .registers 2

    .line 4
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->m()Z

    move-result v0

    return v0
.end method

.method public b(I)V
    .registers 5

    .line 5
    iget v0, p0, Lb/b/q/h0;->b:I

    xor-int/2addr v0, p1

    .line 6
    iput p1, p0, Lb/b/q/h0;->b:I

    if-eqz v0, :cond_55

    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_15

    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_12

    .line 7
    invoke-virtual {p0}, Lb/b/q/h0;->o()V

    .line 8
    :cond_12
    invoke-virtual {p0}, Lb/b/q/h0;->p()V

    :cond_15
    and-int/lit8 v1, v0, 0x3

    if-eqz v1, :cond_1c

    .line 9
    invoke-virtual {p0}, Lb/b/q/h0;->q()V

    :cond_1c
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_3e

    and-int/lit8 v1, p1, 0x8

    if-eqz v1, :cond_33

    .line 10
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    iget-object v2, p0, Lb/b/q/h0;->i:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 11
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    iget-object v2, p0, Lb/b/q/h0;->j:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    goto :goto_3e

    .line 12
    :cond_33
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 13
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    :cond_3e
    :goto_3e
    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_55

    .line 14
    iget-object v0, p0, Lb/b/q/h0;->d:Landroid/view/View;

    if-eqz v0, :cond_55

    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_50

    .line 15
    iget-object p1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_55

    .line 16
    :cond_50
    iget-object p1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_55
    :goto_55
    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 18
    iput-object p1, p0, Lb/b/q/h0;->g:Landroid/graphics/drawable/Drawable;

    .line 19
    invoke-virtual {p0}, Lb/b/q/h0;->p()V

    return-void
.end method

.method public b(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/b/q/h0;->j:Ljava/lang/CharSequence;

    .line 2
    iget v0, p0, Lb/b/q/h0;->b:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_d

    .line 3
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    :cond_d
    return-void
.end method

.method public b(Z)V
    .registers 3

    .line 17
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setCollapsible(Z)V

    return-void
.end method

.method public b()Z
    .registers 2

    .line 4
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->n()Z

    move-result v0

    return v0
.end method

.method public c(I)V
    .registers 3

    .line 1
    iget v0, p0, Lb/b/q/h0;->p:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Lb/b/q/h0;->p:I

    .line 3
    iget-object p1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getNavigationContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_18

    .line 4
    iget p1, p0, Lb/b/q/h0;->p:I

    invoke-virtual {p0, p1}, Lb/b/q/h0;->d(I)V

    :cond_18
    return-void
.end method

.method public c(Ljava/lang/CharSequence;)V
    .registers 3

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lb/b/q/h0;->h:Z

    .line 6
    invoke-virtual {p0, p1}, Lb/b/q/h0;->d(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public c()Z
    .registers 2

    .line 7
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->l()Z

    move-result v0

    return v0
.end method

.method public collapseActionView()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->c()V

    return-void
.end method

.method public d(I)V
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_c

    .line 5
    :cond_4
    invoke-virtual {p0}, Lb/b/q/h0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_c
    invoke-virtual {p0, p1}, Lb/b/q/h0;->a(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final d(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/b/q/h0;->i:Ljava/lang/CharSequence;

    .line 2
    iget v0, p0, Lb/b/q/h0;->b:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_d

    .line 3
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_d
    return-void
.end method

.method public d()Z
    .registers 2

    .line 4
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->r()Z

    move-result v0

    return v0
.end method

.method public e()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lb/b/q/h0;->m:Z

    return-void
.end method

.method public f()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->b()Z

    move-result v0

    return v0
.end method

.method public g()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->d()V

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public h()I
    .registers 2

    .line 1
    iget v0, p0, Lb/b/q/h0;->b:I

    return v0
.end method

.method public i()Landroid/view/ViewGroup;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    return-object v0
.end method

.method public j()I
    .registers 2

    .line 1
    iget v0, p0, Lb/b/q/h0;->o:I

    return v0
.end method

.method public k()V
    .registers 3

    const-string v0, "ToolbarWidgetWrapper"

    const-string v1, "Progress display unsupported"

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public l()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->k()Z

    move-result v0

    return v0
.end method

.method public m()V
    .registers 3

    const-string v0, "ToolbarWidgetWrapper"

    const-string v1, "Progress display unsupported"

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final n()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_13

    const/16 v0, 0xf

    .line 2
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lb/b/q/h0;->q:Landroid/graphics/drawable/Drawable;

    goto :goto_15

    :cond_13
    const/16 v0, 0xb

    :goto_15
    return v0
.end method

.method public final o()V
    .registers 3

    .line 1
    iget v0, p0, Lb/b/q/h0;->b:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1d

    .line 2
    iget-object v0, p0, Lb/b/q/h0;->k:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 3
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    iget v1, p0, Lb/b/q/h0;->p:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setNavigationContentDescription(I)V

    goto :goto_1d

    .line 4
    :cond_16
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    iget-object v1, p0, Lb/b/q/h0;->k:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method public final p()V
    .registers 3

    .line 1
    iget v0, p0, Lb/b/q/h0;->b:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_13

    .line 2
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    iget-object v1, p0, Lb/b/q/h0;->g:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_d

    goto :goto_f

    :cond_d
    iget-object v1, p0, Lb/b/q/h0;->q:Landroid/graphics/drawable/Drawable;

    :goto_f
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    goto :goto_19

    .line 3
    :cond_13
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    :goto_19
    return-void
.end method

.method public final q()V
    .registers 3

    .line 1
    iget v0, p0, Lb/b/q/h0;->b:I

    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_15

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_12

    .line 2
    iget-object v0, p0, Lb/b/q/h0;->f:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_f

    goto :goto_16

    :cond_f
    iget-object v0, p0, Lb/b/q/h0;->e:Landroid/graphics/drawable/Drawable;

    goto :goto_16

    .line 3
    :cond_12
    iget-object v0, p0, Lb/b/q/h0;->e:Landroid/graphics/drawable/Drawable;

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    .line 4
    :goto_16
    iget-object v1, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setIcon(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Lb/b/q/h0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lb/b/q/h0;->setIcon(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 2
    iput-object p1, p0, Lb/b/q/h0;->e:Landroid/graphics/drawable/Drawable;

    .line 3
    invoke-virtual {p0}, Lb/b/q/h0;->q()V

    return-void
.end method

.method public setVisibility(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/h0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    return-void
.end method

.method public setWindowCallback(Landroid/view/Window$Callback;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/h0;->l:Landroid/view/Window$Callback;

    return-void
.end method

.method public setWindowTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/b/q/h0;->h:Z

    if-nez v0, :cond_7

    .line 2
    invoke-virtual {p0, p1}, Lb/b/q/h0;->d(Ljava/lang/CharSequence;)V

    :cond_7
    return-void
.end method
