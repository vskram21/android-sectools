.class public final enum Lorg/eclipse/jgit/lib/IndexDiff$StageState;
.super Ljava/lang/Enum;
.source "IndexDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/IndexDiff;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "StageState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/IndexDiff$StageState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/IndexDiff$StageState;

.field public static final enum ADDED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

.field public static final enum ADDED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

.field public static final enum BOTH_ADDED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

.field public static final enum BOTH_DELETED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

.field public static final enum BOTH_MODIFIED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

.field public static final enum DELETED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

.field public static final enum DELETED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;


# instance fields
.field private final stageMask:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x5

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 104
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const-string v1, "BOTH_DELETED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v4}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_DELETED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 109
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const-string v1, "ADDED_BY_US"

    invoke-direct {v0, v1, v4, v5}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->ADDED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 114
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const-string v1, "DELETED_BY_THEM"

    invoke-direct {v0, v1, v5, v6}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->DELETED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 119
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const-string v1, "ADDED_BY_THEM"

    invoke-direct {v0, v1, v6, v7}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->ADDED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 124
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const-string v1, "DELETED_BY_US"

    invoke-direct {v0, v1, v7, v8}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->DELETED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 129
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const-string v1, "BOTH_ADDED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v8, v2}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_ADDED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 134
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const-string v1, "BOTH_MODIFIED"

    const/4 v2, 0x6

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_MODIFIED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 100
    const/4 v0, 0x7

    new-array v0, v0, [Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    const/4 v1, 0x0

    sget-object v2, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_DELETED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    aput-object v2, v0, v1

    sget-object v1, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->ADDED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->DELETED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->ADDED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->DELETED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    aput-object v1, v0, v7

    sget-object v1, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_ADDED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    aput-object v1, v0, v8

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_MODIFIED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->$VALUES:[Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter "stageMask"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 138
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 139
    iput p3, p0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->stageMask:I

    .line 140
    return-void
.end method

.method static fromMask(I)Lorg/eclipse/jgit/lib/IndexDiff$StageState;
    .locals 1
    .parameter "stageMask"

    .prologue
    .line 169
    packed-switch p0, :pswitch_data_0

    .line 185
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 171
    :pswitch_0
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_DELETED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    goto :goto_0

    .line 173
    :pswitch_1
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->ADDED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    goto :goto_0

    .line 175
    :pswitch_2
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->DELETED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    goto :goto_0

    .line 177
    :pswitch_3
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->ADDED_BY_THEM:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    goto :goto_0

    .line 179
    :pswitch_4
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->DELETED_BY_US:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    goto :goto_0

    .line 181
    :pswitch_5
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_ADDED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    goto :goto_0

    .line 183
    :pswitch_6
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->BOTH_MODIFIED:Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    goto :goto_0

    .line 169
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/IndexDiff$StageState;
    .locals 1
    .parameter "name"

    .prologue
    .line 100
    const-class v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/IndexDiff$StageState;
    .locals 1

    .prologue
    .line 100
    sget-object v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->$VALUES:[Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/IndexDiff$StageState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    return-object v0
.end method


# virtual methods
.method getStageMask()I
    .locals 1

    .prologue
    .line 143
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->stageMask:I

    return v0
.end method

.method public hasBase()Z
    .locals 1

    .prologue
    .line 150
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->stageMask:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasOurs()Z
    .locals 1

    .prologue
    .line 157
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->stageMask:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasTheirs()Z
    .locals 1

    .prologue
    .line 164
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->stageMask:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
