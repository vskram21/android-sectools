.class public final enum Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
.super Ljava/lang/Enum;
.source "MergeCommand.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Config$ConfigEnum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/MergeCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FastForwardMode"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;",
        ">;",
        "Lorg/eclipse/jgit/lib/Config$ConfigEnum;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

.field public static final enum FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

.field public static final enum FF_ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

.field public static final enum NO_FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 117
    new-instance v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    const-string v1, "FF"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    .line 122
    new-instance v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    const-string v1, "NO_FF"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->NO_FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    .line 127
    new-instance v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    const-string v1, "FF_ONLY"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF_ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    .line 112
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->NO_FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF_ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->$VALUES:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

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
    .line 112
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 145
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 112
    const-class v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    return-object v0
.end method

.method public static valueOf(Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;)Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .locals 2
    .parameter "ffMode"

    .prologue
    .line 188
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$api$MergeCommand$FastForwardMode$Merge:[I

    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode$Merge;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 194
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    :goto_0
    return-object v0

    .line 190
    :pswitch_0
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->NO_FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    goto :goto_0

    .line 192
    :pswitch_1
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF_ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    goto :goto_0

    .line 188
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static values()[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    .locals 1

    .prologue
    .line 112
    sget-object v0, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->$VALUES:[Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    return-object v0
.end method


# virtual methods
.method public matchConfigValue(Ljava/lang/String;)Z
    .locals 4
    .parameter "in"

    .prologue
    const/4 v0, 0x0

    .line 134
    invoke-static {p1}, Lorg/eclipse/jgit/util/StringUtils;->isEmptyOrNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 138
    :cond_0
    :goto_0
    return v0

    .line 136
    :cond_1
    const-string v1, "--"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->name()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2d

    const/16 v3, 0x5f

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public toConfigValue()Ljava/lang/String;
    .locals 4

    .prologue
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "--"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5f

    const/16 v3, 0x2d

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
