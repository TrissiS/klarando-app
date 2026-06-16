.class public final synthetic Ld/a/b/f/a/j;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/MainActivity;

.field private final synthetic i:[D

.field private final synthetic j:[D


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/MainActivity;[D[D)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/j;->h:Lnet/nyx/postest/ui/activity/MainActivity;

    iput-object p2, p0, Ld/a/b/f/a/j;->i:[D

    iput-object p3, p0, Ld/a/b/f/a/j;->j:[D

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-object v0, p0, Ld/a/b/f/a/j;->h:Lnet/nyx/postest/ui/activity/MainActivity;

    iget-object v1, p0, Ld/a/b/f/a/j;->i:[D

    iget-object v2, p0, Ld/a/b/f/a/j;->j:[D

    invoke-virtual {v0, v1, v2}, Lnet/nyx/postest/ui/activity/MainActivity;->a([D[D)V

    return-void
.end method
