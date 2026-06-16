.class public final synthetic Ld/a/b/d/a;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/base/AppActivity;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/base/AppActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/d/a;->h:Lnet/nyx/postest/base/AppActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Ld/a/b/d/a;->h:Lnet/nyx/postest/base/AppActivity;

    invoke-virtual {v0}, Lnet/nyx/postest/base/AppActivity;->J()V

    return-void
.end method
