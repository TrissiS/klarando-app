.class public final Lc/a/b/e;
.super Ljava/lang/Object;
.source "MultiFormatWriter.java"

# interfaces
.implements Lc/a/b/g;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lc/a/b/a;",
            "II",
            "Ljava/util/Map<",
            "Lc/a/b/c;",
            "*>;)",
            "Lc/a/b/j/b;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 1
    sget-object v0, Lc/a/b/e$a;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_6e

    .line 2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "No encoder available for format "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3
    :pswitch_22
    new-instance v0, Lc/a/b/i/a;

    invoke-direct {v0}, Lc/a/b/i/a;-><init>()V

    goto :goto_63

    .line 4
    :pswitch_28
    new-instance v0, Lc/a/b/k/a;

    invoke-direct {v0}, Lc/a/b/k/a;-><init>()V

    goto :goto_63

    .line 5
    :pswitch_2e
    new-instance v0, Lc/a/b/l/b;

    invoke-direct {v0}, Lc/a/b/l/b;-><init>()V

    goto :goto_63

    .line 6
    :pswitch_34
    new-instance v0, Lc/a/b/m/a;

    invoke-direct {v0}, Lc/a/b/m/a;-><init>()V

    goto :goto_63

    .line 7
    :pswitch_3a
    new-instance v0, Lc/a/b/l/k;

    invoke-direct {v0}, Lc/a/b/l/k;-><init>()V

    goto :goto_63

    .line 8
    :pswitch_40
    new-instance v0, Lc/a/b/l/d;

    invoke-direct {v0}, Lc/a/b/l/d;-><init>()V

    goto :goto_63

    .line 9
    :pswitch_46
    new-instance v0, Lc/a/b/l/f;

    invoke-direct {v0}, Lc/a/b/l/f;-><init>()V

    goto :goto_63

    .line 10
    :pswitch_4c
    new-instance v0, Lc/a/b/n/a;

    invoke-direct {v0}, Lc/a/b/n/a;-><init>()V

    goto :goto_63

    .line 11
    :pswitch_52
    new-instance v0, Lc/a/b/l/n;

    invoke-direct {v0}, Lc/a/b/l/n;-><init>()V

    goto :goto_63

    .line 12
    :pswitch_58
    new-instance v0, Lc/a/b/l/h;

    invoke-direct {v0}, Lc/a/b/l/h;-><init>()V

    goto :goto_63

    .line 13
    :pswitch_5e
    new-instance v0, Lc/a/b/l/i;

    invoke-direct {v0}, Lc/a/b/l/i;-><init>()V

    :goto_63
    move-object v1, v0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    .line 14
    invoke-interface/range {v1 .. v6}, Lc/a/b/g;->a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    :pswitch_data_6e
    .packed-switch 0x1
        :pswitch_5e
        :pswitch_58
        :pswitch_52
        :pswitch_4c
        :pswitch_46
        :pswitch_40
        :pswitch_3a
        :pswitch_34
        :pswitch_2e
        :pswitch_28
        :pswitch_22
    .end packed-switch
.end method
