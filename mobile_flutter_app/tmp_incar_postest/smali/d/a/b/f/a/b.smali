.class public final synthetic Ld/a/b/f/a/b;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/CashActivity;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/CashActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/b;->h:Lnet/nyx/postest/ui/activity/CashActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Ld/a/b/f/a/b;->h:Lnet/nyx/postest/ui/activity/CashActivity;

    invoke-virtual {v0}, Lnet/nyx/postest/ui/activity/CashActivity;->O()V

    return-void
.end method
