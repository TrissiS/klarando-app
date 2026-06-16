.class public Landroidx/appcompat/widget/ActionMenuPresenter$a;
.super Lb/b/p/j/l;
.source "ActionMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic m:Landroidx/appcompat/widget/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroid/content/Context;Lb/b/p/j/r;Landroid/view/View;)V
    .registers 11

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter$a;->m:Landroidx/appcompat/widget/ActionMenuPresenter;

    .line 2
    sget v5, Lb/b/a;->actionOverflowMenuStyle:I

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lb/b/p/j/l;-><init>(Landroid/content/Context;Lb/b/p/j/g;Landroid/view/View;ZI)V

    .line 3
    invoke-virtual {p3}, Lb/b/p/j/r;->getItem()Landroid/view/MenuItem;

    move-result-object p2

    check-cast p2, Lb/b/p/j/i;

    .line 4
    invoke-virtual {p2}, Lb/b/p/j/i;->h()Z

    move-result p2

    if-nez p2, :cond_25

    .line 5
    iget-object p2, p1, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    if-nez p2, :cond_22

    invoke-static {p1}, Landroidx/appcompat/widget/ActionMenuPresenter;->c(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/n;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    :cond_22
    invoke-virtual {p0, p2}, Lb/b/p/j/l;->a(Landroid/view/View;)V

    .line 6
    :cond_25
    iget-object p1, p1, Landroidx/appcompat/widget/ActionMenuPresenter;->I:Landroidx/appcompat/widget/ActionMenuPresenter$f;

    invoke-virtual {p0, p1}, Lb/b/p/j/l;->a(Lb/b/p/j/m$a;)V

    return-void
.end method


# virtual methods
.method public e()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$a;->m:Landroidx/appcompat/widget/ActionMenuPresenter;

    const/4 v1, 0x0

    iput-object v1, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->F:Landroidx/appcompat/widget/ActionMenuPresenter$a;

    const/4 v1, 0x0

    .line 2
    iput v1, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->J:I

    .line 3
    invoke-super {p0}, Lb/b/p/j/l;->e()V

    return-void
.end method
