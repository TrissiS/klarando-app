.class public Lnet/nyx/postest/ui/activity/PrintActivity$a;
.super Ljava/lang/Object;
.source "PrintActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/postest/ui/activity/PrintActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lnet/nyx/postest/ui/activity/PrintActivity;


# direct methods
.method public constructor <init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic a()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    invoke-static {v0}, Lnet/nyx/postest/ui/activity/PrintActivity;->c(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 5

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p1, v1

    const-string v0, "onServiceConnected: %s"

    invoke-static {v0, p1}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    invoke-static {p2}, Ld/a/c/a/a$a;->a(Landroid/os/IBinder;)Ld/a/c/a/a;

    move-result-object p2

    invoke-static {p1, p2}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Lnet/nyx/postest/ui/activity/PrintActivity;Ld/a/c/a/a;)Ld/a/c/a/a;

    .line 3
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    invoke-static {p1}, Lnet/nyx/postest/ui/activity/PrintActivity;->b(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 5

    .line 1
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Lnet/nyx/postest/ui/activity/PrintActivity;Ld/a/c/a/a;)Ld/a/c/a/a;

    .line 2
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Lnet/nyx/postest/ui/activity/PrintActivity;I)V

    .line 3
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    invoke-static {p1}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Lnet/nyx/postest/ui/activity/PrintActivity;)Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Ld/a/b/f/a/k;

    invoke-direct {v0, p0}, Ld/a/b/f/a/k;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity$a;)V

    const-wide/16 v1, 0x3e8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
