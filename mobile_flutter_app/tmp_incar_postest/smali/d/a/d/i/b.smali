.class public final synthetic Ld/a/d/i/b;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/widget/view/FloatActionButton;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/widget/view/FloatActionButton;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/d/i/b;->h:Lnet/nyx/widget/view/FloatActionButton;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Ld/a/d/i/b;->h:Lnet/nyx/widget/view/FloatActionButton;

    invoke-virtual {v0}, Lnet/nyx/widget/view/FloatActionButton;->c()V

    return-void
.end method
