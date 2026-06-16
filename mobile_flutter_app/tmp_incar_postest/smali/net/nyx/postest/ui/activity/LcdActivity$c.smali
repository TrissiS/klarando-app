.class public Lnet/nyx/postest/ui/activity/LcdActivity$c;
.super Ljava/lang/Object;
.source "LcdActivity.java"

# interfaces
.implements Ld/a/b/f/b/i;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/nyx/postest/ui/activity/LcdActivity;->M()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ld/a/b/f/b/i<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lnet/nyx/postest/ui/activity/LcdActivity;


# direct methods
.method public constructor <init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$c;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ld/a/a/d;)V
    .registers 3

    .line 3
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$c;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lnet/nyx/postest/ui/activity/LcdActivity;->b(Lnet/nyx/postest/ui/activity/LcdActivity;I)V

    return-void
.end method

.method public a(Ld/a/a/d;Ljava/util/HashMap;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ld/a/a/d;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$c;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {p1, p2}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;I)I

    .line 2
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$c;->a:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-static {p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->b(Lnet/nyx/postest/ui/activity/LcdActivity;)I

    move-result p2

    neg-int p2, p2

    add-int/lit8 p2, p2, -0x1

    invoke-static {p1, p2}, Lnet/nyx/postest/ui/activity/LcdActivity;->b(Lnet/nyx/postest/ui/activity/LcdActivity;I)V

    return-void
.end method
