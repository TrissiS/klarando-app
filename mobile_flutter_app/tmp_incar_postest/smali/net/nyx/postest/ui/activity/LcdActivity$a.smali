.class public Lnet/nyx/postest/ui/activity/LcdActivity$a;
.super Ljava/lang/Object;
.source "LcdActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/postest/ui/activity/LcdActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lnet/nyx/postest/ui/activity/LcdActivity;


# direct methods
.method public constructor <init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$a;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic a()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity$a;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-static {v0}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 6

    const/4 p1, 0x1

    new-array v0, p1, [Ljava/lang/Object;

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "onServiceConnected: %s"

    invoke-static {v1, v0}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity$a;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-static {p2}, Ld/a/c/a/a$a;->a(Landroid/os/IBinder;)Ld/a/c/a/a;

    move-result-object p2

    invoke-static {v0, p2}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;Ld/a/c/a/a;)Ld/a/c/a/a;

    .line 3
    iget-object p2, p0, Lnet/nyx/postest/ui/activity/LcdActivity$a;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-static {p2, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;Z)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 5

    .line 1
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$a;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;Ld/a/c/a/a;)Ld/a/c/a/a;

    .line 2
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$a;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;Z)V

    .line 3
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$a;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    new-instance v0, Ld/a/b/f/a/d;

    invoke-direct {v0, p0}, Ld/a/b/f/a/d;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity$a;)V

    const-wide/16 v1, 0xbb8

    invoke-interface {p1, v0, v1, v2}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    return-void
.end method
