.class public final synthetic Ld/a/b/f/a/h;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/LcdActivity;

.field private final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/LcdActivity;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/h;->h:Lnet/nyx/postest/ui/activity/LcdActivity;

    iput p2, p0, Ld/a/b/f/a/h;->i:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-object v0, p0, Ld/a/b/f/a/h;->h:Lnet/nyx/postest/ui/activity/LcdActivity;

    iget v1, p0, Ld/a/b/f/a/h;->i:I

    invoke-virtual {v0, v1}, Lnet/nyx/postest/ui/activity/LcdActivity;->d(I)V

    return-void
.end method
