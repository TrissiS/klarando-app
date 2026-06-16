.class public Lc/c/d/g$b;
.super Ljava/lang/Object;
.source "ToastImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/c/d/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/c/d/g;


# direct methods
.method public constructor <init>(Lc/c/d/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    const/4 v0, 0x0

    .line 1
    :try_start_1
    iget-object v1, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-static {v1}, Lc/c/d/g;->a(Lc/c/d/g;)Lc/c/d/j;

    move-result-object v1

    invoke-virtual {v1}, Lc/c/d/j;->a()Landroid/app/Activity;

    move-result-object v1
    :try_end_b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_b} :catch_37
    .catchall {:try_start_1 .. :try_end_b} :catchall_35

    if-nez v1, :cond_1c

    .line 2
    :goto_d
    iget-object v1, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-static {v1}, Lc/c/d/g;->a(Lc/c/d/g;)Lc/c/d/j;

    move-result-object v1

    invoke-virtual {v1}, Lc/c/d/j;->b()V

    .line 3
    iget-object v1, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-virtual {v1, v0}, Lc/c/d/g;->a(Z)V

    return-void

    :cond_1c
    :try_start_1c
    const-string v2, "window"

    .line 4
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    if-nez v1, :cond_27

    goto :goto_d

    .line 5
    :cond_27
    iget-object v2, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getView()Landroid/view/View;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V
    :try_end_34
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1c .. :try_end_34} :catch_37
    .catchall {:try_start_1c .. :try_end_34} :catchall_35

    goto :goto_3b

    :catchall_35
    move-exception v1

    goto :goto_4a

    :catch_37
    move-exception v1

    .line 6
    :try_start_38
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_35

    .line 7
    :goto_3b
    iget-object v1, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-static {v1}, Lc/c/d/g;->a(Lc/c/d/g;)Lc/c/d/j;

    move-result-object v1

    invoke-virtual {v1}, Lc/c/d/j;->b()V

    .line 8
    iget-object v1, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-virtual {v1, v0}, Lc/c/d/g;->a(Z)V

    return-void

    .line 9
    :goto_4a
    iget-object v2, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->a(Lc/c/d/g;)Lc/c/d/j;

    move-result-object v2

    invoke-virtual {v2}, Lc/c/d/j;->b()V

    .line 10
    iget-object v2, p0, Lc/c/d/g$b;->h:Lc/c/d/g;

    invoke-virtual {v2, v0}, Lc/c/d/g;->a(Z)V

    .line 11
    throw v1
.end method
