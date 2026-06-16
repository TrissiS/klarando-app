.class public Lnet/nyx/postest/core/PackageReceiver$a;
.super Ljava/lang/Object;
.source "PackageReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/postest/core/PackageReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final a:Lnet/nyx/postest/core/PackageReceiver;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lnet/nyx/postest/core/PackageReceiver;

    invoke-direct {v0}, Lnet/nyx/postest/core/PackageReceiver;-><init>()V

    sput-object v0, Lnet/nyx/postest/core/PackageReceiver$a;->a:Lnet/nyx/postest/core/PackageReceiver;

    return-void
.end method

.method public static synthetic a()Lnet/nyx/postest/core/PackageReceiver;
    .registers 1

    .line 1
    sget-object v0, Lnet/nyx/postest/core/PackageReceiver$a;->a:Lnet/nyx/postest/core/PackageReceiver;

    return-object v0
.end method
