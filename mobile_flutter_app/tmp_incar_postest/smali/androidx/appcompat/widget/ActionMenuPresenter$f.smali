.class public Landroidx/appcompat/widget/ActionMenuPresenter$f;
.super Ljava/lang/Object;
.source "ActionMenuPresenter.java"

# interfaces
.implements Lb/b/p/j/m$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field public final synthetic h:Landroidx/appcompat/widget/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/ActionMenuPresenter;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter$f;->h:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/j/g;Z)V
    .registers 5

    .line 5
    instance-of v0, p1, Lb/b/p/j/r;

    if-eqz v0, :cond_c

    .line 6
    invoke-virtual {p1}, Lb/b/p/j/g;->m()Lb/b/p/j/g;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lb/b/p/j/g;->a(Z)V

    .line 7
    :cond_c
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$f;->h:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Lb/b/p/j/b;->b()Lb/b/p/j/m$a;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 8
    invoke-interface {v0, p1, p2}, Lb/b/p/j/m$a;->a(Lb/b/p/j/g;Z)V

    :cond_17
    return-void
.end method

.method public a(Lb/b/p/j/g;)Z
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$f;->h:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-static {v0}, Landroidx/appcompat/widget/ActionMenuPresenter;->d(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;

    move-result-object v0

    const/4 v1, 0x0

    if-ne p1, v0, :cond_a

    return v1

    .line 2
    :cond_a
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$f;->h:Landroidx/appcompat/widget/ActionMenuPresenter;

    move-object v2, p1

    check-cast v2, Lb/b/p/j/r;

    invoke-virtual {v2}, Lb/b/p/j/r;->getItem()Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    iput v2, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->J:I

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$f;->h:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Lb/b/p/j/b;->b()Lb/b/p/j/m$a;

    move-result-object v0

    if-eqz v0, :cond_25

    .line 4
    invoke-interface {v0, p1}, Lb/b/p/j/m$a;->a(Lb/b/p/j/g;)Z

    move-result v1

    :cond_25
    return v1
.end method
