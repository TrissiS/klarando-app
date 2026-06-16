.class public Ld/a/b/g/i;
.super Ljava/lang/Object;
.source "Result.java"


# direct methods
.method public static a(I)I
    .registers 3

    const/16 v0, -0x4bf

    const v1, 0x7f0f00f1

    if-eq p0, v0, :cond_9d

    const/16 v0, -0x3f7

    if-eq p0, v0, :cond_9d

    packed-switch p0, :pswitch_data_a2

    packed-switch p0, :pswitch_data_ac

    packed-switch p0, :pswitch_data_c2

    packed-switch p0, :pswitch_data_d2

    packed-switch p0, :pswitch_data_e6

    goto/16 :goto_a0

    :pswitch_1c
    const v1, 0x7f0f00ee

    goto/16 :goto_a0

    :pswitch_21
    const v1, 0x7f0f00e1

    goto/16 :goto_a0

    :pswitch_26
    const v1, 0x7f0f00ef

    goto/16 :goto_a0

    :pswitch_2b
    const v1, 0x7f0f00ed

    goto/16 :goto_a0

    :pswitch_30
    const v1, 0x7f0f00db

    goto/16 :goto_a0

    :pswitch_35
    const v1, 0x7f0f00d9

    goto/16 :goto_a0

    :pswitch_3a
    const v1, 0x7f0f00d8

    goto/16 :goto_a0

    :pswitch_3f
    const v1, 0x7f0f00d7

    goto/16 :goto_a0

    :pswitch_44
    const v1, 0x7f0f00dd

    goto/16 :goto_a0

    :pswitch_49
    const v1, 0x7f0f00dc

    goto :goto_a0

    :pswitch_4d
    const v1, 0x7f0f00de

    goto :goto_a0

    :pswitch_51
    const v1, 0x7f0f00da

    goto :goto_a0

    :pswitch_55
    const v1, 0x7f0f00d3

    goto :goto_a0

    :pswitch_59
    const v1, 0x7f0f00d2

    goto :goto_a0

    :pswitch_5d
    const v1, 0x7f0f00d1

    goto :goto_a0

    :pswitch_61
    const v1, 0x7f0f00d6

    goto :goto_a0

    :pswitch_65
    const v1, 0x7f0f00d4

    goto :goto_a0

    :pswitch_69
    const v1, 0x7f0f00d5

    goto :goto_a0

    :pswitch_6d
    const v1, 0x7f0f00e2

    goto :goto_a0

    :pswitch_71
    const v1, 0x7f0f00ea

    goto :goto_a0

    :pswitch_75
    const v1, 0x7f0f00e8

    goto :goto_a0

    :pswitch_79
    const v1, 0x7f0f00e9

    goto :goto_a0

    :pswitch_7d
    const v1, 0x7f0f00ec

    goto :goto_a0

    :pswitch_81
    const v1, 0x7f0f00eb

    goto :goto_a0

    :pswitch_85
    const v1, 0x7f0f00e7

    goto :goto_a0

    :pswitch_89
    const v1, 0x7f0f00df

    goto :goto_a0

    :pswitch_8d
    const v1, 0x7f0f00e5

    goto :goto_a0

    :pswitch_91
    const v1, 0x7f0f00e4

    goto :goto_a0

    :pswitch_95
    const v1, 0x7f0f00e3

    goto :goto_a0

    :pswitch_99
    const v1, 0x7f0f00e6

    goto :goto_a0

    :cond_9d
    const v1, 0x7f0f00f0

    :goto_a0
    :pswitch_a0
    return v1

    nop

    :pswitch_data_a2
    .packed-switch -0x50c
        :pswitch_99
        :pswitch_95
        :pswitch_91
    .end packed-switch

    :pswitch_data_ac
    .packed-switch -0x4b9
        :pswitch_8d
        :pswitch_89
        :pswitch_85
        :pswitch_81
        :pswitch_7d
        :pswitch_79
        :pswitch_75
        :pswitch_71
        :pswitch_6d
    .end packed-switch

    :pswitch_data_c2
    .packed-switch -0x45a
        :pswitch_69
        :pswitch_65
        :pswitch_61
        :pswitch_5d
        :pswitch_59
        :pswitch_55
    .end packed-switch

    :pswitch_data_d2
    .packed-switch -0x453
        :pswitch_51
        :pswitch_4d
        :pswitch_49
        :pswitch_44
        :pswitch_3f
        :pswitch_3a
        :pswitch_35
        :pswitch_30
    .end packed-switch

    :pswitch_data_e6
    .packed-switch -0x3ed
        :pswitch_a0
        :pswitch_2b
        :pswitch_26
        :pswitch_21
        :pswitch_1c
    .end packed-switch
.end method
