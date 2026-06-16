.class public final synthetic Ld/a/b/f/a/i;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lnet/nyx/base/BaseActivity$a;


# instance fields
.field private final synthetic a:Lnet/nyx/postest/ui/activity/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/MainActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/i;->a:Lnet/nyx/postest/ui/activity/MainActivity;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 4

    iget-object v0, p0, Ld/a/b/f/a/i;->a:Lnet/nyx/postest/ui/activity/MainActivity;

    invoke-virtual {v0, p1, p2}, Lnet/nyx/postest/ui/activity/MainActivity;->a(ILandroid/content/Intent;)V

    return-void
.end method
