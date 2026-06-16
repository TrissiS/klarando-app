.class public final synthetic Ld/a/b/f/a/y;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ld/a/b/f/b/d;


# instance fields
.field private final synthetic a:Lnet/nyx/postest/ui/activity/PrintActivity;

.field private final synthetic b:Ljava/util/List;

.field private final synthetic c:[I

.field private final synthetic d:[I


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/PrintActivity;Ljava/util/List;[I[I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/y;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    iput-object p2, p0, Ld/a/b/f/a/y;->b:Ljava/util/List;

    iput-object p3, p0, Ld/a/b/f/a/y;->c:[I

    iput-object p4, p0, Ld/a/b/f/a/y;->d:[I

    return-void
.end method


# virtual methods
.method public synthetic a(Ld/a/a/d;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/b/f/b/c;->a(Ld/a/b/f/b/d;Ld/a/a/d;)V

    return-void
.end method

.method public final a(Ld/a/a/d;I)V
    .registers 9

    iget-object v0, p0, Ld/a/b/f/a/y;->a:Lnet/nyx/postest/ui/activity/PrintActivity;

    iget-object v1, p0, Ld/a/b/f/a/y;->b:Ljava/util/List;

    iget-object v2, p0, Ld/a/b/f/a/y;->c:[I

    iget-object v3, p0, Ld/a/b/f/a/y;->d:[I

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Ljava/util/List;[I[ILd/a/a/d;I)V

    return-void
.end method
