.class public abstract Lb/l/d/h;
.super Lb/l/d/e;
.source "FragmentHostCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lb/l/d/e;"
    }
.end annotation


# instance fields
.field public final h:Landroid/app/Activity;

.field public final i:Landroid/content/Context;

.field public final j:Landroid/os/Handler;

.field public final k:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/content/Context;Landroid/os/Handler;I)V
    .registers 5

    .line 2
    invoke-direct {p0}, Lb/l/d/e;-><init>()V

    .line 3
    new-instance p4, Lb/l/d/k;

    invoke-direct {p4}, Lb/l/d/k;-><init>()V

    iput-object p4, p0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    .line 4
    iput-object p1, p0, Lb/l/d/h;->h:Landroid/app/Activity;

    const-string p1, "context == null"

    .line 5
    invoke-static {p2, p1}, Lb/h/l/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p2, Landroid/content/Context;

    iput-object p2, p0, Lb/l/d/h;->i:Landroid/content/Context;

    const-string p1, "handler == null"

    .line 6
    invoke-static {p3, p1}, Lb/h/l/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p3, Landroid/os/Handler;

    iput-object p3, p0, Lb/l/d/h;->j:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/FragmentActivity;)V
    .registers 4

    .line 1
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, p1, p1, v0, v1}, Lb/l/d/h;-><init>(Landroid/app/Activity;Landroid/content/Context;Landroid/os/Handler;I)V

    return-void
.end method


# virtual methods
.method public a(I)Landroid/view/View;
    .registers 2

    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Landroidx/fragment/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 5
    .param p2    # Landroid/content/Intent;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param

    const/4 p1, -0x1

    if-ne p3, p1, :cond_9

    .line 1
    iget-object p1, p0, Lb/l/d/h;->i:Landroid/content/Context;

    invoke-static {p1, p2, p4}, Lb/h/e/a;->a(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)V

    return-void

    .line 2
    :cond_9
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Starting activity with a requestCode requires a FragmentActivity host"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Landroidx/fragment/app/Fragment;)Z
    .registers 2

    const/4 p1, 0x1

    return p1
.end method

.method public e()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public f()Landroid/app/Activity;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/h;->h:Landroid/app/Activity;

    return-object v0
.end method

.method public h()Landroid/content/Context;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/h;->i:Landroid/content/Context;

    return-object v0
.end method

.method public i()Landroid/os/Handler;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/h;->j:Landroid/os/Handler;

    return-object v0
.end method

.method public abstract j()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation
.end method

.method public k()Landroid/view/LayoutInflater;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/h;->i:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public l()V
    .registers 1

    return-void
.end method
