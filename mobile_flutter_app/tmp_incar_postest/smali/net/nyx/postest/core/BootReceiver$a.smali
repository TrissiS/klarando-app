.class public Lnet/nyx/postest/core/BootReceiver$a;
.super Ljava/lang/Object;
.source "BootReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/postest/core/BootReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final a:Lnet/nyx/postest/core/BootReceiver;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lnet/nyx/postest/core/BootReceiver;

    invoke-direct {v0}, Lnet/nyx/postest/core/BootReceiver;-><init>()V

    sput-object v0, Lnet/nyx/postest/core/BootReceiver$a;->a:Lnet/nyx/postest/core/BootReceiver;

    return-void
.end method

.method public static synthetic a()Lnet/nyx/postest/core/BootReceiver;
    .registers 1

    .line 1
    sget-object v0, Lnet/nyx/postest/core/BootReceiver$a;->a:Lnet/nyx/postest/core/BootReceiver;

    return-object v0
.end method
