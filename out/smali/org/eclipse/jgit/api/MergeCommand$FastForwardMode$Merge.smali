.class public final enum Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;
.super Ljava/lang/Enum;
.source "MergeCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Merge"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

.field public static final enum FALSE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

.field public static final enum ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

.field public static final enum TRUE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 149
    new-instance v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    const-string v1, "TRUE"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->TRUE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    .line 153
    new-instance v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    const-string v1, "FALSE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->FALSE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    .line 157
    new-instance v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    const-string v1, "ONLY"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    .line 145
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->TRUE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->FALSE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->$VALUES:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 145
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;
    .locals 1
    .parameter "name"

    .prologue
    .line 145
    const-class v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    return-object v0
.end method

.method public static valueOf(Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;)Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;
    .locals 2
    .parameter "ffMode"

    .prologue
    .line 168
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode:[I

    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 174
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->TRUE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    :goto_0
    return-object v0

    .line 170
    :pswitch_0
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->FALSE:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    goto :goto_0

    .line 172
    :pswitch_1
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    goto :goto_0

    .line 168
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static values()[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;
    .locals 1

    .prologue
    .line 145
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->$VALUES:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;

    return-object v0
.end method
