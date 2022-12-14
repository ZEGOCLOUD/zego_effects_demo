package im.zego.effectsexample.effectsonly.widgets;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import com.midsizemango.effectsonly.R;


public class CustomMinSeekBar extends RelativeLayout {


    private Float min = 0.0f;
    private Float max = 1.0f;
    private String title = "";
    private TextView titleView, minView, maxView, value;
    private SeekBar seekBar;
    private Float currentProgress = 0.0f;
    private Context context;

    public CustomMinSeekBar(Context context) {
        this(context, null);
    }

    public CustomMinSeekBar(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CustomMinSeekBar(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs);
        this.context = context;
        @SuppressLint("CustomViewStyleable")
        TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.customSeekBar);
        View view = inflate(context, R.layout.custom_seek_bar_layout, this);
        String title = typedArray.getString(R.styleable.customSeekBar_title);
        String minStr = typedArray.getString(R.styleable.customSeekBar_minStr);
        String maxStr = typedArray.getString(R.styleable.customSeekBar_maxStr);
        final String describe = typedArray.getString(R.styleable.customSeekBar_describe);
        final String currentProgressStr = typedArray.getString(R.styleable.customSeekBar_currentStr);
        seekBar = view.findViewById(R.id.seek_bar);
        titleView = view.findViewById(R.id.title);
        value = view.findViewById(R.id.value);


        if (title != null && !"".equals(title)) {
            titleView.setText(title);
        }

        if ("".equals(describe) || describe == null) {

        }


        minView = view.findViewById(R.id.min);
        if (minStr != null && !"".equals(minStr)) {
            min = Float.valueOf(minStr);
        }

        maxView = view.findViewById(R.id.max);
        if (maxStr != null && !"".equals(maxStr)) {
            max = Float.valueOf(maxStr);
        }
        setRealSeekBar(min, max);


        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                currentProgress = (progress - ((0 - min) * 100)) / 100;
                value.setText(String.valueOf(currentProgress));
                if (seekBarChangeListener != null) {
                    seekBarChangeListener.onProgressChanged(seekBar, currentProgress, fromUser);
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

                ((Activity)getContext()).getWindow().getDecorView().clearFocus();

                if (seekBarChangeListener != null) {
                    seekBarChangeListener.onStartTrackingTouch(seekBar, currentProgress);
                }

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                if (seekBarChangeListener != null) {
                    seekBarChangeListener.onStopTrackingTouch(seekBar, currentProgress);
                }
            }
        });


        setCurrentValue(Float.valueOf(currentProgressStr));


    }

    public void setRealSeekBar(float min, float max) {
        minView.setText(min + "");
        maxView.setText(max + "");
        seekBar.setMax((int) ((max - min) * 100));

    }

    public static class OnSeekBarChangeListener {
        public void onProgressChanged(SeekBar seekBar, float progress, boolean fromUser) {
        };

        public void onStartTrackingTouch(SeekBar seekBar, float progress) {
        };


        public void onStopTrackingTouch(SeekBar seekBar, float progress) {
        };
    }

    private OnSeekBarChangeListener seekBarChangeListener;

    public synchronized void setOnSeekBarChangeListener(OnSeekBarChangeListener listener) {
        this.seekBarChangeListener = listener;
    }


    public void setCurrentValue(float currentProgress) {
        this.currentProgress = currentProgress;
        seekBar.setProgress((int) ((currentProgress - min) * 100));

    }

    public void setMin(Float min) {
        this.min = min;
        setRealSeekBar(this.min, max);
        setCurrentValue(this.currentProgress);
    }

    public void setMax(Float max) {
        this.max = max;
        setRealSeekBar(this.min, max);
        setCurrentValue(this.currentProgress);
    }

    public float getCurrentValue() {
        return currentProgress;
    }
}