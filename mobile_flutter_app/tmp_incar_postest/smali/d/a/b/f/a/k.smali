.class public final synthetic Ld/a/b/f/a/k;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/PrintActivity$a;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/PrintActivity$a;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/k;->h:Lnet/nyx/postest/ui/activity/PrintActivity$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Ld/a/b/f/a/k;->h:Lnet/nyx/postest/ui/activity/PrintActivity$a;

    invoke-virtual {v0}, Lnet/nyx/postest/ui/activity/PrintActivity$a;->a()V

    return-void
.end method
