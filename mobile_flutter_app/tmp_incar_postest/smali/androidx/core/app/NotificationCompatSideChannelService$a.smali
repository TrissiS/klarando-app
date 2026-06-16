.class public Landroidx/core/app/NotificationCompatSideChannelService$a;
.super La/a/a/a/a$a;
.source "NotificationCompatSideChannelService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/app/NotificationCompatSideChannelService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Landroidx/core/app/NotificationCompatSideChannelService;


# direct methods
.method public constructor <init>(Landroidx/core/app/NotificationCompatSideChannelService;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/core/app/NotificationCompatSideChannelService$a;->a:Landroidx/core/app/NotificationCompatSideChannelService;

    invoke-direct {p0}, La/a/a/a/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 5

    .line 11
    iget-object v0, p0, Landroidx/core/app/NotificationCompatSideChannelService$a;->a:Landroidx/core/app/NotificationCompatSideChannelService;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroidx/core/app/NotificationCompatSideChannelService;->a(ILjava/lang/String;)V

    .line 12
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 13
    :try_start_d
    iget-object v2, p0, Landroidx/core/app/NotificationCompatSideChannelService$a;->a:Landroidx/core/app/NotificationCompatSideChannelService;

    invoke-virtual {v2, p1}, Landroidx/core/app/NotificationCompatSideChannelService;->a(Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_16

    .line 14
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_16
    move-exception p1

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 15
    throw p1
.end method

.method public a(Ljava/lang/String;ILjava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 6
    iget-object v0, p0, Landroidx/core/app/NotificationCompatSideChannelService$a;->a:Landroidx/core/app/NotificationCompatSideChannelService;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroidx/core/app/NotificationCompatSideChannelService;->a(ILjava/lang/String;)V

    .line 7
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 8
    :try_start_d
    iget-object v2, p0, Landroidx/core/app/NotificationCompatSideChannelService$a;->a:Landroidx/core/app/NotificationCompatSideChannelService;

    invoke-virtual {v2, p1, p2, p3}, Landroidx/core/app/NotificationCompatSideChannelService;->a(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_16

    .line 9
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_16
    move-exception p1

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 10
    throw p1
.end method

.method public a(Ljava/lang/String;ILjava/lang/String;Landroid/app/Notification;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/core/app/NotificationCompatSideChannelService$a;->a:Landroidx/core/app/NotificationCompatSideChannelService;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroidx/core/app/NotificationCompatSideChannelService;->a(ILjava/lang/String;)V

    .line 2
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 3
    :try_start_d
    iget-object v2, p0, Landroidx/core/app/NotificationCompatSideChannelService$a;->a:Landroidx/core/app/NotificationCompatSideChannelService;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroidx/core/app/NotificationCompatSideChannelService;->a(Ljava/lang/String;ILjava/lang/String;Landroid/app/Notification;)V
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_16

    .line 4
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_16
    move-exception p1

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 5
    throw p1
.end method
