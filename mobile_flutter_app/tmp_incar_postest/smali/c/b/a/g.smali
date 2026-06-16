.class public Lc/b/a/g;
.super Ljava/lang/Object;
.source "FitsKeyboard.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public h:Lc/b/a/h;

.field public i:Landroid/view/Window;

.field public j:Landroid/view/View;

.field public k:Landroid/view/View;

.field public l:Landroid/view/View;

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:Z


# direct methods
.method public constructor <init>(Lc/b/a/h;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lc/b/a/g;->m:I

    iput v0, p0, Lc/b/a/g;->n:I

    iput v0, p0, Lc/b/a/g;->o:I

    iput v0, p0, Lc/b/a/g;->p:I

    .line 3
    iput-object p1, p0, Lc/b/a/g;->h:Lc/b/a/h;

    .line 4
    invoke-virtual {p1}, Lc/b/a/h;->v()Landroid/view/Window;

    move-result-object v1

    iput-object v1, p0, Lc/b/a/g;->i:Landroid/view/Window;

    .line 5
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lc/b/a/g;->j:Landroid/view/View;

    const v2, 0x1020002

    .line 6
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 7
    invoke-virtual {p1}, Lc/b/a/h;->z()Z

    move-result v2

    if-eqz v2, :cond_43

    .line 8
    invoke-virtual {p1}, Lc/b/a/h;->u()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_36

    .line 9
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->M()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    goto :goto_57

    .line 10
    :cond_36
    invoke-virtual {p1}, Lc/b/a/h;->p()Landroid/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_57

    .line 11
    invoke-virtual {p1}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    goto :goto_57

    .line 12
    :cond_43
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    if-eqz p1, :cond_57

    .line 13
    instance-of v2, p1, Landroidx/drawerlayout/widget/DrawerLayout;

    if-eqz v2, :cond_57

    .line 14
    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    .line 15
    :cond_57
    :goto_57
    iget-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    if-eqz p1, :cond_79

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    iput p1, p0, Lc/b/a/g;->m:I

    .line 17
    iget-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    iput p1, p0, Lc/b/a/g;->n:I

    .line 18
    iget-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result p1

    iput p1, p0, Lc/b/a/g;->o:I

    .line 19
    iget-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    iput p1, p0, Lc/b/a/g;->p:I

    .line 20
    :cond_79
    iget-object p1, p0, Lc/b/a/g;->l:Landroid/view/View;

    if-eqz p1, :cond_7e

    move-object v1, p1

    :cond_7e
    iput-object v1, p0, Lc/b/a/g;->k:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_16

    iget-boolean v0, p0, Lc/b/a/g;->r:Z

    if-eqz v0, :cond_16

    .line 7
    iget-object v0, p0, Lc/b/a/g;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lc/b/a/g;->r:Z

    :cond_16
    return-void
.end method

.method public a(I)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1b

    .line 2
    iget-object v0, p0, Lc/b/a/g;->i:Landroid/view/Window;

    invoke-virtual {v0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 3
    iget-boolean p1, p0, Lc/b/a/g;->r:Z

    if-nez p1, :cond_1b

    .line 4
    iget-object p1, p0, Lc/b/a/g;->j:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lc/b/a/g;->r:Z

    :cond_1b
    return-void
.end method

.method public b()V
    .registers 6

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_39

    iget-boolean v0, p0, Lc/b/a/g;->r:Z

    if-eqz v0, :cond_39

    .line 2
    iget-object v0, p0, Lc/b/a/g;->l:Landroid/view/View;

    if-eqz v0, :cond_1c

    .line 3
    iget-object v0, p0, Lc/b/a/g;->k:Landroid/view/View;

    iget v1, p0, Lc/b/a/g;->m:I

    iget v2, p0, Lc/b/a/g;->n:I

    iget v3, p0, Lc/b/a/g;->o:I

    iget v4, p0, Lc/b/a/g;->p:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_39

    .line 4
    :cond_1c
    iget-object v0, p0, Lc/b/a/g;->k:Landroid/view/View;

    iget-object v1, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v1}, Lc/b/a/h;->r()I

    move-result v1

    iget-object v2, p0, Lc/b/a/g;->h:Lc/b/a/h;

    .line 5
    invoke-virtual {v2}, Lc/b/a/h;->t()I

    move-result v2

    iget-object v3, p0, Lc/b/a/g;->h:Lc/b/a/h;

    .line 6
    invoke-virtual {v3}, Lc/b/a/h;->s()I

    move-result v3

    iget-object v4, p0, Lc/b/a/g;->h:Lc/b/a/h;

    .line 7
    invoke-virtual {v4}, Lc/b/a/h;->q()I

    move-result v4

    .line 8
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    :cond_39
    :goto_39
    return-void
.end method

.method public onGlobalLayout()V
    .registers 9

    .line 1
    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    if-eqz v0, :cond_ea

    invoke-virtual {v0}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v0

    if-eqz v0, :cond_ea

    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v0

    iget-boolean v0, v0, Lc/b/a/c;->J:Z

    if-eqz v0, :cond_ea

    .line 2
    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->n()Lc/b/a/a;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lc/b/a/a;->f()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {v0}, Lc/b/a/a;->b()I

    move-result v1

    goto :goto_29

    :cond_25
    invoke-virtual {v0}, Lc/b/a/a;->c()I

    move-result v1

    .line 4
    :goto_29
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 5
    iget-object v3, p0, Lc/b/a/g;->j:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 6
    iget-object v3, p0, Lc/b/a/g;->k:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v2

    .line 7
    iget v2, p0, Lc/b/a/g;->q:I

    if-eq v3, v2, :cond_ea

    .line 8
    iput v3, p0, Lc/b/a/g;->q:I

    .line 9
    iget-object v2, p0, Lc/b/a/g;->i:Landroid/view/Window;

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    const v4, 0x1020002

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lc/b/a/h;->a(Landroid/view/View;)Z

    move-result v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v2, :cond_b9

    .line 10
    iget-object v2, p0, Lc/b/a/g;->l:Landroid/view/View;

    if-eqz v2, :cond_94

    .line 11
    iget-object v2, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v2}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v2

    iget-boolean v2, v2, Lc/b/a/c;->I:Z

    if-eqz v2, :cond_71

    .line 12
    iget-object v2, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v2}, Lc/b/a/h;->l()I

    move-result v2

    invoke-virtual {v0}, Lc/b/a/a;->d()I

    move-result v6

    add-int/2addr v2, v6

    add-int/2addr v3, v2

    .line 13
    :cond_71
    iget-object v2, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v2}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v2

    iget-boolean v2, v2, Lc/b/a/c;->C:Z

    if-eqz v2, :cond_80

    .line 14
    invoke-virtual {v0}, Lc/b/a/a;->d()I

    move-result v0

    add-int/2addr v3, v0

    :cond_80
    if-le v3, v1, :cond_86

    .line 15
    iget v0, p0, Lc/b/a/g;->p:I

    add-int/2addr v0, v3

    goto :goto_88

    :cond_86
    const/4 v0, 0x0

    const/4 v4, 0x0

    .line 16
    :goto_88
    iget-object v1, p0, Lc/b/a/g;->k:Landroid/view/View;

    iget v2, p0, Lc/b/a/g;->m:I

    iget v6, p0, Lc/b/a/g;->n:I

    iget v7, p0, Lc/b/a/g;->o:I

    invoke-virtual {v1, v2, v6, v7, v0}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_be

    .line 17
    :cond_94
    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->q()I

    move-result v0

    sub-int/2addr v3, v1

    if-le v3, v1, :cond_a0

    add-int v0, v3, v1

    goto :goto_a1

    :cond_a0
    const/4 v4, 0x0

    .line 18
    :goto_a1
    iget-object v1, p0, Lc/b/a/g;->k:Landroid/view/View;

    iget-object v2, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v2}, Lc/b/a/h;->r()I

    move-result v2

    iget-object v6, p0, Lc/b/a/g;->h:Lc/b/a/h;

    .line 19
    invoke-virtual {v6}, Lc/b/a/h;->t()I

    move-result v6

    iget-object v7, p0, Lc/b/a/g;->h:Lc/b/a/h;

    .line 20
    invoke-virtual {v7}, Lc/b/a/h;->s()I

    move-result v7

    .line 21
    invoke-virtual {v1, v2, v6, v7, v0}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_be

    :cond_b9
    sub-int/2addr v3, v1

    if-le v3, v1, :cond_bd

    goto :goto_be

    :cond_bd
    const/4 v4, 0x0

    :goto_be
    if-gez v3, :cond_c1

    goto :goto_c2

    :cond_c1
    move v5, v3

    .line 22
    :goto_c2
    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v0

    iget-object v0, v0, Lc/b/a/c;->P:Lc/b/a/o;

    if-eqz v0, :cond_d7

    .line 23
    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v0

    iget-object v0, v0, Lc/b/a/c;->P:Lc/b/a/o;

    invoke-interface {v0, v4, v5}, Lc/b/a/o;->a(ZI)V

    :cond_d7
    if-nez v4, :cond_ea

    .line 24
    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v0

    iget-object v0, v0, Lc/b/a/c;->q:Lc/b/a/b;

    sget-object v1, Lc/b/a/b;->FLAG_SHOW_BAR:Lc/b/a/b;

    if-eq v0, v1, :cond_ea

    .line 25
    iget-object v0, p0, Lc/b/a/g;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->D()V

    :cond_ea
    return-void
.end method
