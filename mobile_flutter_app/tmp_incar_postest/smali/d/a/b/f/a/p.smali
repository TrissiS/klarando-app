.class public final synthetic Ld/a/b/f/a/p;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ld/a/b/f/b/d;


# instance fields
.field private final synthetic a:Lnet/nyx/postest/ui/activity/PrintActivity;

.field private final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/PrintActivity;Ljava/util/List;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/p;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    iput-object p2, p0, Ld/a/b/f/a/p;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public synthetic a(Ld/a/a/d;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/b/f/b/c;->a(Ld/a/b/f/b/d;Ld/a/a/d;)V

    return-void
.end method

.method public final a(Ld/a/a/d;I)V
    .registers 5

    iget-object v0, p0, Ld/a/b/f/a/p;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    iget-object v1, p0, Ld/a/b/f/a/p;->b:Ljava/util/List;

    invoke-virtual {v0, v1, p1, p2}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Ljava/util/List;Ld/a/a/d;I)V

    return-void
.end method
