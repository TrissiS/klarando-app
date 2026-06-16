.class public Landroidx/appcompat/widget/ActionMenuPresenter$d$a;
.super Lb/b/q/t;
.source "ActionMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/ActionMenuPresenter$d;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic q:Landroidx/appcompat/widget/ActionMenuPresenter$d;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/ActionMenuPresenter$d;Landroid/view/View;Landroidx/appcompat/widget/ActionMenuPresenter;)V
    .registers 4

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter$d$a;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    invoke-direct {p0, p2}, Lb/b/q/t;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b()Lb/b/p/j/p;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$d$a;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuPresenter$d;->j:Landroidx/appcompat/widget/ActionMenuPresenter;

    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->E:Landroidx/appcompat/widget/ActionMenuPresenter$e;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_a
    invoke-virtual {v0}, Lb/b/p/j/l;->c()Lb/b/p/j/k;

    move-result-object v0

    return-object v0
.end method

.method public c()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$d$a;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuPresenter$d;->j:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionMenuPresenter;->k()Z

    const/4 v0, 0x1

    return v0
.end method

.method public d()Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$d$a;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuPresenter$d;->j:Landroidx/appcompat/widget/ActionMenuPresenter;

    iget-object v1, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

    if-eqz v1, :cond_a

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_a
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionMenuPresenter;->g()Z

    const/4 v0, 0x1

    return v0
.end method
