.class public Landroidx/appcompat/widget/ActionMenuPresenter$c;
.super Ljava/lang/Object;
.source "ActionMenuPresenter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public h:Landroidx/appcompat/widget/ActionMenuPresenter$e;

.field public final synthetic i:Landroidx/appcompat/widget/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroidx/appcompat/widget/ActionMenuPresenter$e;)V
    .registers 3

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->i:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->h:Landroidx/appcompat/widget/ActionMenuPresenter$e;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->i:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-static {v0}, Landroidx/appcompat/widget/ActionMenuPresenter;->e(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->i:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-static {v0}, Landroidx/appcompat/widget/ActionMenuPresenter;->f(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;

    move-result-object v0

    invoke-virtual {v0}, Lb/b/p/j/g;->a()V

    .line 3
    :cond_11
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->i:Landroidx/appcompat/widget/ActionMenuPresenter;

    invoke-static {v0}, Landroidx/appcompat/widget/ActionMenuPresenter;->g(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/n;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_2f

    .line 4
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->h:Landroidx/appcompat/widget/ActionMenuPresenter$e;

    invoke-virtual {v0}, Lb/b/p/j/l;->g()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 5
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->i:Landroidx/appcompat/widget/ActionMenuPresenter;

    iget-object v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->h:Landroidx/appcompat/widget/ActionMenuPresenter$e;

    iput-object v1, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->E:Landroidx/appcompat/widget/ActionMenuPresenter$e;

    .line 6
    :cond_2f
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter$c;->i:Landroidx/appcompat/widget/ActionMenuPresenter;

    const/4 v1, 0x0

    iput-object v1, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

    return-void
.end method
