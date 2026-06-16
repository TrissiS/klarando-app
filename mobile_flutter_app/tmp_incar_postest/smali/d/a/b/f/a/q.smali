.class public final synthetic Ld/a/b/f/a/q;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/PrintActivity;

.field private final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/PrintActivity;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/q;->h:Lnet/nyx/postest/ui/activity/PrintActivity;

    iput p2, p0, Ld/a/b/f/a/q;->i:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-object v0, p0, Ld/a/b/f/a/q;->h:Lnet/nyx/postest/ui/activity/PrintActivity;

    iget v1, p0, Ld/a/b/f/a/q;->i:I

    invoke-virtual {v0, v1}, Lnet/nyx/postest/ui/activity/PrintActivity;->c(I)V

    return-void
.end method
